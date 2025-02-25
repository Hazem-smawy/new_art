import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class RecordController extends GetxController {
  final _recorder = AudioRecorder();
  final _audioPlayer = AudioPlayer();
  var isRecording = false.obs;
  var recordingPath = ''.obs; // Holds the directory path for recordings
  var isPlaying = false.obs;
  var recordAudioFilePath = ''.obs;
  @override
  void onInit() {
    super.onInit();
    _setupAudioPlayerListener();
  }

  Future<void> requestMicrophonePermission() async {
    var status = await Permission.microphone.status;
    if (!status.isGranted) {
      status = await Permission.microphone.request();
    }
    if (!status.isGranted) {
      throw Exception('Microphone permission not granted');
    }
  }

  // void _setupAudioPlayerListener() {
  //   _audioPlayer.playerStateStream.listen((playerState) {
  //     // Handle audio completion
  //     if (playerState.processingState == ProcessingState.completed) {
  //       stopAudio();
  //     }
  //   });
  // }

  Future<void> startRecording() async {
    isRecording.value = true;
    await requestMicrophonePermission();
    if (await _recorder.hasPermission()) {
      if (recordingPath.value.isEmpty) {
        await _prepareLocalPath();
      }
      final filePath = '$recordingPath/audio_record.m4a';
      recordAudioFilePath.value = filePath;
      await _recorder.start(const RecordConfig(), path: filePath);
    }
  }

  Future<void> stopRecording() async {
    await _recorder.stop();
    isRecording.value = false;
    final filePath = '$recordingPath/audio_record.m4a';

    try {
      await _audioPlayer.setFilePath(filePath);
      recordAudioFilePath.value = filePath;
      // ignore: empty_catches
    } catch (e) {}
  }

  // Future<void> playRecordedAudio() async {
  //   try {
  //     await _audioPlayer.play();
  //     isPlaying.value = true;
  //   } catch (e) {
  //     print('Error playing audio: $e');
  //   }
  // }
  // Future<void> playRecordedAudio() async {
  //   try {
  //     await _audioPlayer.play();
  //     isPlaying.value = true;

  //     // Optional: Reset to beginning when playback completes
  //     _audioPlayer.positionStream.listen((position) {
  //       if (position == _audioPlayer.duration) {
  //         stopAudio();
  //       }
  //     });
  //   } catch (e) {
  //     print('Error playing audio: $e');
  //   }
  // }

  Future<void> pauseAudio() async {
    await _audioPlayer.pause();
    isPlaying.value = false;
  }

  // Future<void> stopAudio() async {
  //   await _audioPlayer.stop();
  //   isPlaying.value = false;
  // }

  // Future<void> _prepareLocalPath() async {
  //   final directory = await getExternalStorageDirectory();
  //   recordingPath.value = directory?.path ?? '';

  //   final savedDir = Directory(recordingPath.value);
  //   if (!savedDir.existsSync()) {
  //     savedDir.createSync(recursive: true);
  //   }
  // }

  void _setupAudioPlayerListener() {
    _audioPlayer.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        // When audio completes: stop, reset position, and update state
        stopAudio(resetPosition: true);
      }
    });
  }

  Future<void> playRecordedAudio() async {
    try {
      // Always ensure we're at the start before playing
      isPlaying.value = true;

      await _audioPlayer.seek(Duration.zero);
      await _audioPlayer.play();
      // isPlaying.value = true;
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  Future<void> stopAudio({bool resetPosition = false}) async {
    await _audioPlayer.stop();
    if (resetPosition) {
      await _audioPlayer.seek(Duration.zero);
    }
    isPlaying.value = false;
  }

  // Update path handling to use proper storage
  Future<void> _prepareLocalPath() async {
    final directory = await getApplicationDocumentsDirectory();
    recordingPath.value = directory.path;

    final savedDir = Directory(recordingPath.value);
    if (!savedDir.existsSync()) {
      savedDir.createSync(recursive: true);
    }
  }

  @override
  void onClose() {
    _recorder.dispose();
    _audioPlayer.dispose();
    super.onClose();
  }
}
