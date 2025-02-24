import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/utils/duration_formater.dart';
import 'package:newart/src/features/audio_player/presentation/getX/audio_player_controller.dart';
import 'package:newart/src/features/product/presentation/getX/product_controller.dart';

import '../../../../core/types/status_types.dart';

class PlayerWidget extends StatelessWidget {
  PlayerWidget({
    super.key,
  });

  final AudioController audioController = Get.find();
  ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      bottom: 0,
      child: Obx(() {
        if (productController.allProductStatus.value != Status.success) {
          return SizedBox.shrink();
        }
        return AnimatedSlide(
          duration: const Duration(milliseconds: 300),
          offset: audioController.isPlaying.value
              ? Offset.zero
              : const Offset(0, 1),
          curve: Curves.easeInOut,
          child: AnimatedContainer(
            duration: Duration(seconds: 1), // Animation duration
            margin: EdgeInsets.all(8),
            width: context.width - 2 * 8,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  audioController.isTimeLineShow.value ? 20 : 50),
              gradient: LinearGradient(
                colors: [
                  audioController.backgroundColor.value,
                  audioController.backgroundColor.value.withAlpha(180),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                // Timeline Seek Bar
                if (audioController.isTimeLineShow.value)
                  Obx(() {
                    return Column(
                      children: [
                        if (audioController.duration.value > Duration.zero)
                          Slider(
                            value: audioController.position.value.inSeconds
                                .toDouble(),
                            min: 0,
                            max: audioController.duration.value.inSeconds
                                .toDouble(),
                            onChanged: (value) async {
                              await audioController.player
                                  .seek(Duration(seconds: value.toInt()));
                            },
                            activeColor: context.whiteColor,
                            inactiveColor: context.whiteColor.withAlpha(100),
                          ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                formatDuration(audioController.position.value),
                                style: context.bodySmall.copyWith(
                                  color: context.whiteColor,
                                ),
                              ),
                              Text(
                                formatDuration(audioController.duration.value),
                                style: context.bodySmall.copyWith(
                                  color: context.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                // Player Controls
                Row(
                  children: [
                    // Previous Button
                    IconButton(
                      onPressed: () {
                        if (audioController.currentIndex.value > 0) {
                          audioController.position.value = Duration.zero;
                          audioController.currentIndex.value--;
                          audioController
                              .playAudio(audioController.currentIndex.value);
                        }
                      },
                      icon: Icon(
                        Icons.skip_previous_outlined,
                        size: 25,
                        color: context.whiteColor,
                      ),
                    ),
                    // Play/Pause Button
                    Obx(() => IconButton(
                          onPressed: () {
                            if (audioController.isPlaying.value) {
                              audioController.pauseAudio();
                            } else {
                              audioController.playAudio(
                                  audioController.currentIndex.value);
                            }
                          },
                          icon: Icon(
                            audioController.isPlaying.value
                                ? Icons.pause_circle_outline
                                : Icons.play_circle_outline,
                            size: 30,
                            color: context.whiteColor,
                          ),
                        )),
                    // Next Button
                    IconButton(
                      onPressed: () {
                        if (audioController.currentIndex.value <
                            audioController.audioList.length - 1) {
                          audioController.position.value = Duration.zero;

                          audioController.currentIndex.value++;
                          audioController
                              .playAudio(audioController.currentIndex.value);
                        }
                      },
                      icon: Icon(
                        Icons.skip_next_outlined,
                        size: 25,
                        color: context.whiteColor,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        final currentIndex = audioController.playbackSpeeds
                            .indexOf(audioController.speed.value);
                        // Calculate next index with wrap-around
                        final nextIndex = (currentIndex + 1) %
                            audioController.playbackSpeeds.length;
                        // Set new speed
                        audioController.setPlaybackSpeed(
                            audioController.playbackSpeeds[nextIndex]);
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: context.containerColor.withAlpha(1),
                          ),
                        ),
                        child: Text(
                          '${audioController.speed.value}x',
                          style: context.bodyLarge.copyWith(
                            color: context.whiteColor,
                          ),
                        ),
                      ),
                    ),
                    // Song Title with Marquee Effect
                    Expanded(
                      child: Obx(() {
                        final title = audioController.audioList.isEmpty
                            ? ""
                            : audioController
                                .audioList[audioController.currentIndex.value]
                                .name;
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: title.length >
                                  20 // Add marquee effect for long titles
                              ? SizedBox(
                                  width: double.infinity,
                                  height:
                                      45, // Ensures it fills the available width
                                  child: Marquee(
                                    text: title,
                                    style: context.bodyLarge.copyWith(
                                      color: context.whiteColor,
                                    ),
                                    scrollAxis: Axis.horizontal,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    blankSpace: 20.0,
                                    velocity: 50.0,
                                    pauseAfterRound: const Duration(seconds: 1),
                                    // startPadding: 10.0,
                                    accelerationDuration:
                                        const Duration(seconds: 1),
                                    accelerationCurve: Curves.linear,
                                    decelerationDuration:
                                        const Duration(milliseconds: 500),
                                    decelerationCurve: Curves.easeOut,
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    title,
                                    textAlign: TextAlign.center,
                                    style: context.bodyLarge.copyWith(
                                      color: context.whiteColor,
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                ),
                        );
                      }),
                    ),

                    // Add some spacing
                    // context.g8,
                    IconButton(
                      onPressed: () {
                        audioController.isTimeLineShow.value =
                            !audioController.isTimeLineShow.value;
                      },
                      icon: Icon(
                        audioController.isTimeLineShow.value
                            ? Icons.arrow_drop_down_rounded
                            : Icons.arrow_drop_up_rounded,
                        size: 25,
                        color: context.whiteColor,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
