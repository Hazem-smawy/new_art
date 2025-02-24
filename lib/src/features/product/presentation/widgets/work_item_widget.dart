import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/helpers/download_file.dart';
import 'package:newart/src/core/utils/dialogs.dart';
import 'package:newart/src/features/audio_player/presentation/getX/audio_player_controller.dart';
import 'package:newart/src/features/home/presentation/getX/home_controller.dart';
import 'package:newart/src/features/product/presentation/widgets/work_item_icon_item_widget.dart';
import 'package:newart/src/features/product/data/models/product_model.dart';

class WorkItemWidget extends StatelessWidget {
  final ProductModel product;
  final int index;

  WorkItemWidget({
    super.key,
    required this.product,
    required this.index,
  });
  DownloadController downloadController = Get.put(DownloadController());
  HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    final AudioController audioController = Get.find();

    return Obx(() {
      final isCurrentlyPlaying = audioController.currentIndex.value == index;

      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        padding: EdgeInsets.symmetric(
          horizontal: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'اسم الفنان',
                  style: context.bodyMedium,
                ),
                context.g8,
                Icon(
                  Icons.person_outline,
                  size: 20,
                  color: context.secondaryTextColor,
                ),
                // Spacer(),
                context.g12,
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (isCurrentlyPlaying &&
                          audioController.isPlaying.value) {
                        audioController.pauseAudio();
                      } else {
                        audioController.currentIndex.value = index;
                        audioController.playAudio(index);
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Text(
                            product.name,
                            // overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textDirection: TextDirection.rtl,
                            style: context.displayMedium.copyWith(
                              color: context.secondaryTextColor,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                        context.g8,
                        // Animated Play Icon
                        if (isCurrentlyPlaying &&
                            audioController.isPlaying.value)
                          Icon(
                            Icons.pause_circle_outline,
                            size: 25,
                            color: context.secondaryTextColor,
                          )
                        else
                          Icon(
                            Icons.play_circle_outline,
                            size: 25,
                            color: context.secondaryTextColor,
                          ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            context.g4,
            Row(
              children: [
                Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green.withAlpha(10),
                  ),
                  child: Text(
                    'بدون موسيقى',
                    style: context.bodySmall.copyWith(
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
            context.g4,
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: context.sp28,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        WorkItemIconItemWidget(
                          icon: Icons.headphones_outlined,
                          label: 'k100',
                        ),
                        WorkItemIconItemWidget(
                          icon: Icons.share_outlined,
                          label: 'k100',
                        ),
                        GestureDetector(
                          onTap: () {
                            CustomDialog.customSnackBar(
                                'سيتم تحميل الصوت', SnackPosition.TOP, false);
                            downloadController.downloadFile(
                                "${homeController.homeData.value!.links.first.businessAudioLinks}${product.audioProduct}");
                          },
                          child: WorkItemIconItemWidget(
                            icon: Icons.download_outlined,
                            label: 'k100',
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Spacer(),
                IconButton.outlined(
                  style: ButtonStyle(
                    side: WidgetStateProperty.resolveWith<BorderSide>((states) {
                      if (states.contains(WidgetState.pressed)) {
                        return BorderSide(
                          color: Colors.black,
                          width: 1,
                        ); // Border color when pressed
                      }
                      return BorderSide(
                        color: context.secondaryTextColor.withAlpha(50),
                        width: 1,
                      ); // Default border color
                    }),
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    size: 20,
                  ),
                ),
                // context.g4,
                // IconButton.filled(
                //   onPressed: () {},
                //   icon: Icon(
                //     Icons.add_shopping_cart_outlined,
                //     size: 20,
                //   ),
                // ),
              ],
            )
          ],
        ),
      );
    });
  }
}

// class AnimatedPlayIcon extends StatefulWidget {
//   final bool isPlaying;

//   const AnimatedPlayIcon({super.key, required this.isPlaying});

//   @override
//   _AnimatedPlayIconState createState() => _AnimatedPlayIconState();
// }

// class _AnimatedPlayIconState extends State<AnimatedPlayIcon>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 500),
//     );

//     _animation = Tween<double>(begin: 0.8, end: 1.2).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Curves.easeInOut,
//       ),
//     );

//     if (widget.isPlaying) {
//       _controller.repeat(reverse: true);
//     } else {
//       _controller.stop();
//     }
//   }

//   @override
//   void didUpdateWidget(AnimatedPlayIcon oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.isPlaying) {
//       _controller.repeat(reverse: true);
//     } else {
//       _controller.stop();
//     }
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ScaleTransition(
//       scale: _animation,
//       child: Icon(
//         widget.isPlaying ? Icons.pause_outlined : Icons.play_circle_outline,
//         size: 25,
//         color: context.primaryColor,
//       ),
//     );
//   }
// }
