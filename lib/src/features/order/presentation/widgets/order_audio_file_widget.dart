import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/features/home/presentation/getX/home_controller.dart';
import 'package:newart/src/features/order/data/models/order_model.dart';

import '../../../audio_player/presentation/getX/audio_player_controller.dart';
import '../../../product/data/models/product_model.dart';

class OrderAudioFileWidget extends StatefulWidget {
  const OrderAudioFileWidget({super.key, required this.orderModel});
  final OrderModel orderModel;

  @override
  State<OrderAudioFileWidget> createState() => _OrderAudioFileWidgetState();
}

class _OrderAudioFileWidgetState extends State<OrderAudioFileWidget> {
  AudioController audioController = Get.find();

  HomeController homeController = Get.find();
  @override
  @override
  void initState() {
    super.initState();

    // Safely extract the audio link prefix
    final homeData = homeController.homeData.value;
    String audioLinkPrefix = '';

    if (homeData != null && homeData.links.isNotEmpty) {
      audioLinkPrefix = homeData.links.first.requestAudioLink;
    }

    // Create the product models using the safely obtained audioLinkPrefix
    audioController.setSession(null, [
      ProductModel(
        id: 1,
        name: 'from_order_files',
        slug: 'slug',
        description: 'description',
        nameEn: 'nameEn',
        slugEn: 'slugEn',
        descriptionEn: 'descriptionEn',
        productCategoryId: 1,
        productImage: 'productImage',
        featured: 1,
        status: 1,
        createdAt: 'createdAt',
        updatedAt: 'updatedAt',
        audioProduct: '$audioLinkPrefix${widget.orderModel.audioAttachment}',
      ),
      ProductModel(
        id: 2,
        name: 'from_order_files',
        slug: 'slug1',
        description: 'description1',
        nameEn: 'nameEn1',
        slugEn: 'slugEn1',
        descriptionEn: 'descriptionEn',
        productCategoryId: 1,
        productImage: 'productImage1',
        featured: 1,
        status: 1,
        createdAt: 'createdAt',
        updatedAt: 'updatedAt',
        audioProduct: '$audioLinkPrefix${widget.orderModel.audioClip}',
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        context.g12,
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'الملفات الصوتية',
            style: context.titleMedium,
          ),
        ),
        context.g4,
        Obx(
          () => Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (audioController.isPlaying.value) {
                      audioController.pauseAudio();
                    } else {
                      audioController.position.value = Duration.zero;
                      audioController.playAudio(1);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: context.secondaryTextColor.withAlpha(
                          50,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            widget.orderModel.audioAttachment,
                            style: context.bodyLarge,
                          ),
                        ),
                        context.g8,
                        SizedBox(
                          // width: 50,
                          // height: 50,
                          child: Icon(
                            (audioController.isPlaying.value &&
                                    audioController.currentIndex.value == 1)
                                ? Icons.pause_circle_outline
                                : Icons.play_circle_outline,
                            color: context.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              context.g8,
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (audioController.isPlaying.value) {
                      audioController.pauseAudio();
                    } else {
                      audioController.position.value = Duration.zero;
                      audioController.playAudio(0);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: context.secondaryTextColor.withAlpha(
                          50,
                        ),
                      ),
                    ),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          widget.orderModel.audioClip,
                          textAlign: TextAlign.right,
                          style: context.bodyLarge,
                        ),
                        context.g12,
                        FaIcon(
                          (audioController.isPlaying.value &&
                                  audioController.currentIndex.value == 0)
                              ? Icons.pause_circle_outline
                              : Icons.play_circle_outline,
                          color: context.secondaryTextColor,
                          size: 22,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        context.g4
      ],
    );
  }
}
