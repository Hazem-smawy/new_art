import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/extensions/padding_extension.dart';
import 'package:newart/src/core/utils/data_format.dart';
import 'package:newart/src/core/widgets/cached_image_widget.dart';
import 'package:newart/src/core/widgets/thin_divider_widget.dart';
import 'package:newart/src/features/audio_player/presentation/getX/audio_player_controller.dart';
import 'package:newart/src/features/home/presentation/getX/home_controller.dart';
import 'package:newart/src/features/product/data/models/product_model.dart';

class HomeProductDetailsSheet extends StatefulWidget {
  const HomeProductDetailsSheet(
      {super.key, required this.product, this.func, this.index});
  final bool? func;
  final int? index;

  final ProductModel product;

  @override
  State<HomeProductDetailsSheet> createState() =>
      _HomeProductDetailsSheetState();
}

class _HomeProductDetailsSheetState extends State<HomeProductDetailsSheet> {
  final HomeController homeController = Get.find();

  // final URLAudioController urlAudioController = Get.find()..pauseAudio();
  AudioController audioController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.func == null) {
      audioController.setSession(
          "${homeController.homeData.value!.links.first.businessAudioLinks}${widget.product.audioProduct}",
          null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Column(
        children: [
          context.g4,
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: context.primary,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedImageWidget(
                  imageUrl:
                      '${homeController.homeData.value?.links.first.imageLink}${widget.product.image}',
                  height: 200,
                ),
              ).pv(16),
              context.g8,
              Obx(
                () => GestureDetector(
                  onTap: () {
                    if (widget.func != null) {
                      if ((audioController.currentIndex.value ==
                              widget.index) &&
                          audioController.isPlaying.value) {
                        audioController.pauseAudio();
                      } else {
                        audioController.currentIndex.value = widget.index!;
                        audioController.playAudio(widget.index!);
                      }
                    } else {
                      if (audioController.isPlaying.value) {
                        audioController.pauseAudio();
                      } else {
                        audioController.position.value = Duration.zero;

                        audioController.playAudio(0);
                      }
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.product.name,
                        style: context.titleMedium.copyWith(
                            color: audioController.isPlaying.value
                                ? Colors.green
                                : context.blackColor),
                      ),
                      context.g8,
                      !audioController.isPlaying.value
                          ? Icon(
                              Icons.play_circle_outline,
                              size: 30,
                              color: context.secondaryTextColor,
                            )
                          : Icon(
                              Icons.pause_circle_outline,
                              size: 30,
                              color: Colors.green,
                            ),
                    ],
                  ),
                ),
              ),
              context.g16,
              Row(
                children: [
                  Spacer(),
                  Text(
                    timeString2String(widget.product.updatedAt),
                    style: context.bodyMedium,
                  ),
                  context.g12,
                  Icon(
                    Icons.calendar_month_outlined,
                    color: context.secondaryTextColor,
                    size: 20,
                  ),
                  Spacer(),
                  Text(
                    'اسم الفنان',
                    style: context.bodyMedium,
                  ),
                  context.g12,
                  Icon(
                    Icons.person_outline,
                    color: context.secondaryTextColor,
                    size: 20,
                  ),
                ],
              ),
              // context.g16,
              ThinDividerWidget(),
              Text(
                'descritption',
                style: context.bodySmall,
              )
            ],
          ).ph(16),
        ],
      ),
    );
  }
}
