import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class AudioController extends GetxController {
  final _recorder = AudioRecorder();
  var isRecording = false.obs;
  var recordingPath = ''.obs;

  Future<void> requestMicrophonePermission() async {
    var status = await Permission.microphone.status;
    if (!status.isGranted) {
      status = await Permission.microphone.request();
    }
    if (!status.isGranted) {
      throw Exception('Microphone permission not granted');
    }
  }

  Future<void> startRecording() async {
    await requestMicrophonePermission();
    if (await _recorder.hasPermission()) {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/audio_record.m4a';
      await _recorder.start(const RecordConfig(), path: filePath);

      isRecording.value = true;
      recordingPath.value = filePath;
    }
  }

  Future<void> stopRecording() async {
    await _recorder.stop();
    isRecording.value = false;
  }

  @override
  void onClose() {
    _recorder.dispose();
    super.onClose();
  }
}

class AudioRecorderView extends StatelessWidget {
  final audioController = Get.put(AudioController());

  AudioRecorderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Audio Recorder')),
      body: Center(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (audioController.isRecording.value) {
                    audioController.stopRecording();
                  } else {
                    audioController.startRecording();
                  }
                },
                child: Text(audioController.isRecording.value
                    ? 'Stop Recording'
                    : 'Start Recording'),
              ),
              SizedBox(height: 20),
              if (!audioController.isRecording.value &&
                  audioController.recordingPath.isNotEmpty)
                Text(
                    'Recording saved at: ${audioController.recordingPath.value}'),
            ],
          );
        }),
      ),
    );
  }
}
