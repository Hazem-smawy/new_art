// The main widget that shows a grid of OrderItems
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/routes/app_pages.dart';
import 'package:newart/src/core/utils/data_format.dart';
import 'package:newart/src/core/widgets/custom_outline_btn_widget.dart';
import 'package:newart/src/features/audio_player/presentation/getX/audio_player_controller.dart';
import 'package:newart/src/features/exclusive/data/models/exclusive_model.dart';
import 'package:newart/src/features/home/presentation/getX/home_controller.dart';

import '../../../../core/widgets/cached_image_widget.dart';

class ExclusiveHomeWidget extends StatelessWidget {
  const ExclusiveHomeWidget({super.key, required this.items});
  final List<ExclusiveModel> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'الحصريات',
              style: context.titleMedium,
            ),
          ),
          context.g8,
          ExclusiveListView(
            items: items,
          ),
          context.g16,
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: context.width / 1.2,
              child: CustomOutlineBtnWidget(
                action: () {
                  Get.toNamed(Routes.EXCLUSIVE);
                },
                title: 'عرض الكل',
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ExclusiveListView extends StatefulWidget {
  final List<ExclusiveModel> items;

  const ExclusiveListView({super.key, required this.items});

  @override
  State<ExclusiveListView> createState() => _ExclusiveListViewState();
}

class _ExclusiveListViewState extends State<ExclusiveListView> {
  AudioController audioController = Get.find();
  HomeController homeController = Get.find();
  var random = Random();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // final products = widget.items
    //     .map(
    //       (e) => ProductModel(
    //         id: e.id,
    //         name: e.nameOrder,
    //         slug: e.slug,
    //         description: e.orderData,
    //         nameEn: 'nameEn',
    //         slugEn: 'slugEn',
    //         descriptionEn: 'descriptionEn',
    //         productCategoryId: e.productCategoryId,
    //         productImage:
    //             'https://i.pinimg.com/736x/1e/6d/0a/1e6d0a95510b4e3d662aa777674697d1.jpg',
    //         featured: 1,
    //         status: e.orderStatus,
    //         createdAt: e.createdAt,
    //         updatedAt: e.updatedAt,
    //         audioProduct: e.audioAttachment,
    //       ),
    //     )
    //     .toList();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   audioController.setSession(null, products);
    // });
  }

  final images = [
    'https://i.pinimg.com/736x/1e/6d/0a/1e6d0a95510b4e3d662aa777674697d1.jpg',
    'https://i.pinimg.com/736x/d6/be/64/d6be6469430482dff19b45250bcd109c.jpg',
    'https://i.pinimg.com/736x/88/c3/e5/88c3e500e2eec9b0751331b45fa56afd.jpg',
    'https://i.pinimg.com/736x/6d/16/21/6d1621e454ae008986afe53e4e6a8894.jpg',
    'https://i.pinimg.com/736x/29/9c/73/299c73b1c25dc16dff94c80b0eef8ec3.jpg',
    'https://i.pinimg.com/736x/8d/33/4b/8d334b940b01b9d74fb32d37be144700.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          AnimatedContainer(
            duration: Duration(microseconds: 200),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: homeController.isOpenForexclusive.value
                    ? 1
                    : 2, // Two columns
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio:
                    homeController.isOpenForexclusive.value ? 1.3 : 0.78,
              ),
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                int randomNumber = random.nextInt(6);

                return ExclusiveItemWidget(
                  item: widget.items[index],
                  index: index,
                  image: images[randomNumber],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Card widget for each OrderItem
class ExclusiveItemWidget extends StatelessWidget {
  final ExclusiveModel item;
  final int index;
  final String image;
  ExclusiveItemWidget(
      {super.key,
      required this.item,
      required this.index,
      required this.image});
  final AudioController audioController = Get.find();
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            CachedImageWidget(
              imageUrl: image,
              height: double.infinity,
            ),
            SizedBox(
              // height: 120,
              width: double.infinity,
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: NetworkImage(image),
              //     fit: BoxFit.cover,
              //   ),
              // ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withAlpha(5),
                      Colors.black.withAlpha(100),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 16,
              left: 8,
              child: Icon(
                Icons.more_vert_outlined,
                color: context.whiteColor,
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Title (nameOrder)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      item.nameOrder,
                      style: context.titleMedium.copyWith(
                        color: context.whiteColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // Artist name
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      timeString2String(item.dateOrder),
                      style: context.bodySmall.copyWith(
                        color: context.whiteColor,
                      ),
                    ),
                  ),

                  // const Spacer(),
                  // Audio play icon widget

                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AudioPlayIcon(
                        isPlaying:
                            audioController.currentIndex.value == index &&
                                audioController.isPlaying.value,
                        onPressed: () {
                          if (audioController.isPlaying.value) {
                            print('object');
                            audioController.setSession(
                                '${homeController.homeData.value?.links.first.mainLink}sounds/${item.audioClip}',
                                null);
                            audioController.currentIndex.value = index;
                            audioController.playAudio(0);
                          } else {
                            audioController.pauseAudio();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )

            // Display image (using workingLink as image URL)
          ],
        ),
      ),
    );
  }
}

// A simple widget that displays a play icon and triggers a callback
class AudioPlayIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isPlaying;
  const AudioPlayIcon(
      {super.key, required this.onPressed, required this.isPlaying});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: context.whiteColor,
      icon: Icon(
        isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
      ),
      iconSize: 40,
      onPressed: onPressed,
    );
  }
}

// Example usage in your main app
