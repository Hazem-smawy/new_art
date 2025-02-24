import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/widgets/cached_image_widget.dart';
import 'package:newart/src/features/home/presentation/getX/home_controller.dart';

class HomeSliderWidget extends StatelessWidget {
  HomeSliderWidget({
    super.key,
  });
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 300,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(right: 16),
          reverse: true,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedImageWidget(
                    imageUrl:
                        '${homeController.homeData.value?.links.first.imageLink}${homeController.homeData.value?.slider.first.image}',
                    width: context.width - 200,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedImageWidget(
                    imageUrl:
                        '${homeController.homeData.value?.links.first.imageLink}${homeController.homeData.value?.slider[1].image}',
                    width: context.width - 200,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 40),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedImageWidget(
                    imageUrl:
                        '${homeController.homeData.value?.links.first.imageLink}${homeController.homeData.value?.slider[2].image}',
                    width: context.width - 200,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
