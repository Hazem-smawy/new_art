import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:newart/src/core/extensions/color_extension.dart';
import 'package:newart/src/features/home/presentation/getX/home_controller.dart';
import 'package:newart/src/features/product/data/models/product_model.dart';

// class AudioController extends GetxController {
//   final player = AudioPlayer();
//   var isPlaying = false.obs;
//   var currentIndex = 0.obs;
//   var position = Duration.zero.obs;
//   var duration = Duration.zero.obs;
//   var backgroundColor = Colors.blue.obs; // Reactive background color
//   var isTimeLineShow = false.obs;
//   var speed = 1.0.obs;
//   var playbackSpeeds = [1.0, 1.25, 2.0];

//   final audioList = <ProductModel>[].obs;
//   HomeController homeController = Get.find();

//   @override
//   void onInit() {
//     super.onInit();
//     configureAudioSession();
//     _listenToPlayerState();
//   }

//   Future setSession() async {
//     await configureAudioSession();
//     _listenToPlayerState();
//   }

//   Future<void> configureAudioSession() async {
//     await player.setAudioSource(ConcatenatingAudioSource(
//       children: audioList
//           .map((audio) => AudioSource.uri(Uri.parse(
//               "${homeController.homeData.value!.links.first.businessAudioLinks}${audio.audioProduct}")))
//           .toList(),
//     ));
//   }

//   Future<void> setPlaybackSpeed(double newSpeed) async {
//     if (playbackSpeeds.contains(newSpeed)) {
//       speed.value = newSpeed;
//       await player.setSpeed(newSpeed);
//     }
//   }

//   void _listenToPlayerState() {
//     // Listen to position changes
//     player.positionStream.listen((pos) {
//       position.value = pos;
//     });

//     // Listen to duration changes
//     player.durationStream.listen((dur) {
//       duration.value = dur ?? Duration.zero;
//     });

//     // Listen to player state changes
//     player.playerStateStream.listen((state) {
//       isPlaying.value = state.playing;
//       _updateBackgroundColor(); // Update background color when state changes
//     });
//   }

//   void _updateBackgroundColor() {
//     if (isPlaying.value) {
//       // Change to a random color or gradient when playing
//       backgroundColor.value =
//           Colors.primaries[Random().nextInt(Colors.primaries.length)];
//       backgroundColor.value.darken(0);
//     } else {
//       // Reset to default color when paused
//       backgroundColor.value = Colors.blue;
//     }
//   }

//   void playAudio(int index) async {
//     currentIndex.value = index;
//     // position.value = Duration.zero;
//     await player.seek(position.value, index: index);
//     await player.play();
//     isPlaying.value = true;
//   }

//   void pauseAudio() async {
//     await player.pause();
//     isPlaying.value = false;
//   }

//   @override
//   void onClose() {
//     player.dispose();
//     super.onClose();
//   }
// }

// // class URLAudioController extends GetxController {
// //   final player = AudioPlayer();
// //   var isPlaying = false.obs;
// //   var currentUrl = ''.obs;

// //   /// Plays audio from the provided [url].
// //   Future<void> playAudio(String url) async {
// //     print(url);
// //     try {
// //       // If the provided URL is different from the currently loaded one,
// //       // load the new audio source.
// //       if (currentUrl.value != url) {
// //         await player.setUrl(url);
// //         currentUrl.value = url;
// //       }
// //       await player.play();
// //       isPlaying.value = true;
// //     } catch (e) {
// //       print("Error playing audio: $e");
// //     }
// //   }

// //   /// Pauses the currently playing audio.
// //   Future<void> pauseAudio() async {
// //     try {
// //       await player.pause();
// //       isPlaying.value = false;
// //     } catch (e) {
// //       print("Error pausing audio: $e");
// //     }
// //   }

// //   /// Optional: Toggles play/pause state for the given [url].
// //   /// If the audio is playing, it pauses it; if it's paused, it starts playing.
// //   Future<void> togglePlayPause(String url) async {
// //     if (isPlaying.value) {
// //       await pauseAudio();
// //     } else {
// //       await playAudio(url);
// //     }
// //   }

// //   @override
// //   void onClose() {
// //     player.dispose();
// //     super.onClose();
// //   }
// // }

// // import 'package:get/get.dart';
// // import 'package:just_audio/just_audio.dart';

// class URLAudioController extends GetxController {
//   final player = AudioPlayer();
//   var isPlaying = false.obs;
//   var currentUrl = ''.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     // Listen for changes in the player's processing state.
//     player.processingStateStream.listen((state) {
//       // When the audio completes, update the play state.
//       if (state == ProcessingState.completed) {
//         isPlaying.value = false;
//         // Optionally reset the playback position:
//         // player.seek(Duration.zero);
//       }
//     });
//   }

//   /// Plays audio from the provided [url].
//   Future<void> playAudio(String url) async {
//     print(url);
//     isPlaying.value = true;

//     try {
//       // If the provided URL is different from the currently loaded one,
//       // load the new audio source.
//       if (currentUrl.value != url) {
//         await player.setUrl(url);
//         currentUrl.value = url;
//       } else {
//         // If it's the same URL, restart the audio from the beginning.
//         await player.seek(Duration.zero);
//       }
//       await player.play();
//     } catch (e) {
//       print("Error playing audio: $e");
//     }
//   }

//   /// Pauses the currently playing audio.
//   Future<void> pauseAudio() async {
//     try {
//       await player.pause();
//       isPlaying.value = false;
//     } catch (e) {
//       print("Error pausing audio: $e");
//     }
//   }

//   /// Toggles play/pause state for the given [url].
//   Future<void> togglePlayPause(String url) async {
//     if (isPlaying.value) {
//       await pauseAudio();
//     } else {
//       await playAudio(url);
//     }
//   }

//   @override
//   void onClose() {
//     player.dispose();
//     super.onClose();
//   }
// }

// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:newart/src/core/extensions/color_extension.dart';
// import 'package:newart/src/features/home/presentation/getX/home_controller.dart';
// import 'package:newart/src/features/product/data/models/product_model.dart';

class AudioController extends GetxController {
  final player = AudioPlayer();
  var isPlaying = false.obs;
  var currentIndex = 0.obs;
  var position = Duration.zero.obs;
  var duration = Duration.zero.obs;
  var backgroundColor = Colors.blue.obs;
  var isTimeLineShow = false.obs;
  var speed = 1.0.obs;
  var playbackSpeeds = [1.0, 1.25, 2.0];

  final audioList = <ProductModel>[].obs;
  HomeController homeController = Get.find();

  String? singleAudioUrl; // Used for single URL playback

  @override
  void onInit() {
    super.onInit();
    configureAudioSession();
    _listenToPlayerState();
  }

  Future setSession(String? url, List<ProductModel>? audioData) async {
    singleAudioUrl = url;
    print(url);

    audioList.value = audioData ?? [];

    await configureAudioSession();
    _listenToPlayerState();
  }

  Future<void> configureAudioSession() async {
    if (singleAudioUrl != null) {
      // Use a single URL if provided
      await player.setUrl(singleAudioUrl!);
    } else if (audioList.isNotEmpty) {
      // Use audio list if provided
      await player.setAudioSource(ConcatenatingAudioSource(
        children: audioList.map((audio) {
          return audio.name == "from_order_files"
              ? AudioSource.uri(Uri.parse(audio.audioProduct))
              : AudioSource.uri(Uri.parse(
                  "${homeController.homeData.value!.links.first.businessAudioLinks}${audio.audioProduct}"));
        }).toList(),
      ));
    }
  }

  Future<void> setPlaybackSpeed(double newSpeed) async {
    if (playbackSpeeds.contains(newSpeed)) {
      speed.value = newSpeed;
      await player.setSpeed(newSpeed);
    }
  }

  void _listenToPlayerState() {
    player.positionStream.listen((pos) {
      position.value = pos;
    });

    player.durationStream.listen((dur) {
      duration.value = dur ?? Duration.zero;
    });

    player.playerStateStream.listen((state) {
      isPlaying.value = state.playing;
      _updateBackgroundColor();
    });
  }

  void _updateBackgroundColor() {
    if (isPlaying.value) {
      backgroundColor.value =
          Colors.primaries[Random().nextInt(Colors.primaries.length)];
      backgroundColor.value.darken(0);
    } else {
      backgroundColor.value = Colors.blue;
    }
  }

  void playAudio(int index) async {
    currentIndex.value = index;
    await player.seek(position.value, index: index);
    await player.play();
    isPlaying.value = true;
  }

  void pauseAudio() async {
    await player.pause();
    isPlaying.value = false;
  }

  @override
  void onClose() {
    player.dispose();
    super.onClose();
  }
}
