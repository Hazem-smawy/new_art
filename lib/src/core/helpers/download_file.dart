import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class DownloadController extends GetxController {
  var progress = 0.obs; // Reactive variable for progress
  var status = DownloadTaskStatus.undefined.obs; // Reactive variable for status
  String? _localPath;
  final ReceivePort _port = ReceivePort();

  @override
  void onInit() {
    super.onInit();

    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      DownloadTaskStatus updatedStatus = DownloadTaskStatus.values[data[1]];
      int updatedProgress = data[2];

      // Update reactive variables
      status.value = updatedStatus;
      progress.value = updatedProgress;
      if (updatedStatus == DownloadTaskStatus.complete) {
        openDownloadedFile();
      }
    });

    // Register the download callback
    FlutterDownloader.registerCallback(downloadCallback);

    _prepareLocalPath();
  }

  Future<void> downloadFile(String url, {String? fileName}) async {
    if (_localPath == null) {
      await _prepareLocalPath();
    }

    // Extract file name from URL if not provided
    final String finalFileName = fileName ?? extractFileNameFromUrl(url);

    try {
      await FlutterDownloader.enqueue(
        url: url,
        savedDir: _localPath!,
        fileName: finalFileName,
        showNotification: true,
        openFileFromNotification: true,
      );
    } catch (e) {
      Get.snackbar("Download Error", "Failed to download file: $e");
    }
  }

  Future<void> _prepareLocalPath() async {
    final directory = await getExternalStorageDirectory(); // Safer for API 30+
    _localPath = directory?.path;

    // Ensure the directory exists
    final savedDir = Directory(_localPath!);
    if (!savedDir.existsSync()) {
      savedDir.createSync(recursive: true);
    }
  }

  Future<void> openDownloadedFile() async {
    final tasks = await FlutterDownloader.loadTasks();
    if (tasks != null && tasks.isNotEmpty) {
      final task = tasks.firstWhere(
        (task) => task.status == DownloadTaskStatus.complete,
      );

      await FlutterDownloader.open(taskId: task.taskId);
    }
  }

  String extractFileNameFromUrl(String url) {
    try {
      // Parse the URL
      final uri = Uri.parse(url);
      // Get the path segments
      final pathSegments = uri.pathSegments;
      // The last segment is usually the file name
      final fileName = pathSegments.last;
      return fileName;
    } catch (e) {
      // Fallback if URL parsing fails
      return "file_${DateTime.now().millisecondsSinceEpoch}";
    }
  }

  @pragma('vm:entry-point')
  static void downloadCallback(String id, int status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');

    // Introduce a delay if the status is COMPLETE
    if (status == DownloadTaskStatus.complete.index) {
      sleep(const Duration(seconds: 1)); // Sleep for 1 second
    }
    // Open the file when the download is complete

    send?.send([id, status, progress]);
  }

  @override
  void onClose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.onClose();
  }
}
