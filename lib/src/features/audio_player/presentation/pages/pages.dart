import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_art/src/features/audio_player/presentation/getX/audio_player_controller.dart';

class AudioListView extends StatelessWidget {
  final audioController = Get.put(AudioController());

  AudioListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player'),
      ),
      body: ListView.builder(
        itemCount: audioController.audioList.length,
        itemBuilder: (context, index) {
          final audio = audioController.audioList[index];
          return Obx(() {
            final isCurrent = audioController.currentIndex.value == index;
            return ListTile(
              title: Text(audio.title),
              trailing: isCurrent && audioController.isPlaying.value
                  ? IconButton(
                      icon: Icon(Icons.pause),
                      onPressed: () => audioController.pauseAudio(),
                    )
                  : IconButton(
                      icon: Icon(Icons.play_arrow),
                      onPressed: () => audioController.playAudio(index),
                    ),
            );
          });
        },
      ),
    );
  }
}
