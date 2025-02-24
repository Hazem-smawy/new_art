import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/types/status_types.dart';
import 'package:newart/src/core/widgets/beautiful_simple_loading.dart';
import 'package:newart/src/core/widgets/error_state_widget.dart';

import 'package:newart/src/core/widgets/header_widget.dart';
import 'package:newart/src/core/widgets/thin_divider_widget.dart';
import 'package:newart/src/features/product/data/models/product_model.dart';

import '../../../audio_player/presentation/getX/audio_player_controller.dart';
import '../../../home/presentation/widgets/home_product_details_sheet.dart';
import '../getX/product_controller.dart';
import '../widgets/categories_with_search_widget.dart';
import '../widgets/player_widget.dart';
import '../widgets/work_item_widget.dart';

class AllProductPage extends StatefulWidget {
  const AllProductPage({super.key});

  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  final AudioController audioController = Get.find();

  ProductController productController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const HeaderWidget(title: 'جميع الاعمال'),
                  context.g12,
                  CategoriesWithSearchWidget(),
                  context.g16,
                  Obx(() {
                    switch (productController.allProductStatus.value) {
                      case Status.success:
                        return ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.only(bottom: 100),
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              _showProductDetails(
                                audioController.audioList[index],
                                index,
                              );
                            },
                            child: WorkItemWidget(
                              product: audioController.audioList[index],
                              index: index,
                            ),
                          ),
                          separatorBuilder: (context, index) =>
                              ThinDividerWidget(),
                          itemCount: audioController.audioList.length,
                        );

                      case Status.loading:
                        return BeautifulSimpleLoading();
                      default:
                        return ErrorStateWidget(
                            onRetry: productController.fetchAllProduct);
                    }
                  })
                ],
              ),
            ),
            PlayerWidget()
          ],
        ),
      ),
      floatingActionButton: Obx(
        () => audioController.isPlaying.value
            ? SizedBox()
            : Material(
                shape: const CircleBorder(),
                color: Colors.transparent, // Your desired background color
                elevation: 0,
                child: IconButton.filled(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.blue, // Match with Material color
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (audioController.isPlaying.value) {
                      audioController.pauseAudio();
                    } else {
                      productController.allProductStatus.value == Status.success
                          ? audioController
                              .playAudio(audioController.currentIndex.value)
                          : null;
                    }
                  },
                  icon: SizedBox(
                      width: 40,
                      height: 40,
                      child: const Icon(Icons.play_arrow_outlined)),
                ),
              ),
      ),
    );
  }

  void _showProductDetails(ProductModel product, int index) {
    Get.bottomSheet(HomeProductDetailsSheet(
      product: product,
      func: true,
      index: index,
    ));
  }
}
