import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/routes/app_pages.dart';
import 'package:newart/src/core/widgets/cached_image_widget.dart';

import 'package:newart/src/features/home/presentation/getX/home_controller.dart';
import 'package:newart/src/features/home/presentation/widgets/home_product_details_sheet.dart';
import 'package:newart/src/features/product/data/models/product_model.dart';

import '../../../audio_player/presentation/getX/audio_player_controller.dart';

class HomeOurRecentWorkWidget extends StatelessWidget {
  HomeOurRecentWorkWidget({super.key});

  final HomeController homeController = Get.find();
  final AudioController audioController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          _buildHeader(context),
          context.g12,
          _buildProductList(context),
        ],
      ),
    );
  }

  /// Builds the header row with the title.
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          context.g12,
          const Spacer(),
          Text(
            'احدث اعمالنا',
            style: context.titleLarge,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }

  /// Builds the horizontally scrolling list of product items.
  Widget _buildProductList(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Obx(() {
        final homeData = homeController.homeData.value;
        // Check for null or empty data.
        if (homeData == null || homeData.product.isEmpty) {
          return const SizedBox.shrink();
        }
        final productCount = homeData.product.length;
        final baseImageUrl = homeData.links.first.imageLink;

        return ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(right: 16),
          reverse: true,
          separatorBuilder: (context, index) => context.g12,
          itemCount: productCount + 1,
          itemBuilder: (context, index) {
            // The last item is a button to view more work.
            if (index == productCount) {
              return _buildMoreButton(context);
            }
            final product = homeData.product[index];
            // Alternate the display based on index parity.
            return (index % 2 == 0)
                ? _buildLargeProductItem(context, product, baseImageUrl)
                : _buildSmallProductItem(context, product, baseImageUrl);
          },
        );
      }),
    );
  }

  /// A button that navigates to the new work page.
  Widget _buildMoreButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.PRODUCTS);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 12),
        width: 30,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: context.containerColor,
        ),
        child: Center(
          child: FaIcon(
            FontAwesomeIcons.chevronLeft,
            color: context.blackColor,
          ),
        ),
      ),
    );
  }

  /// Builds a larger product item for even indices with a gradient overlay.
  Widget _buildLargeProductItem(
      BuildContext context, ProductModel product, String baseImageUrl) {
    return GestureDetector(
      onTap: () => _showProductDetails(product),
      child: SizedBox(
        width: 180,
        child: Stack(
          children: [
            // Display the product image.
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedImageWidget(
                imageUrl: '$baseImageUrl${product.image}',
                width: 180,
                height: double.infinity,
              ),
            ),
            // Gradient overlay for text visibility.
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 40,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withAlpha(200),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // Arabic text on top of the gradient.
            Positioned(
              bottom: 0,
              left: 10,
              right: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  product.name,
                  style: context.bodySmall.copyWith(color: Colors.white),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a smaller product item for odd indices with a gradient overlay.
  Widget _buildSmallProductItem(
      BuildContext context, ProductModel product, String baseImageUrl) {
    return GestureDetector(
      onTap: () => _showProductDetails(product),
      child: Container(
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: context.secondaryTextColor.withAlpha(50),
          ),
        ),
        child: Stack(
          children: [
            // Display the product image.
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedImageWidget(
                imageUrl: '$baseImageUrl${product.image}',
                width: 90,
                height: double.infinity,
              ),
            ),
            // Center icon.
            Center(
              child: FaIcon(
                Icons.music_note_outlined,
                size: 30,
                color: context.secondaryTextColor,
              ),
            ),
            // Gradient overlay at the bottom.
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 40,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withAlpha(200),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // Product name text.
            Positioned(
              bottom: 0,
              left: 10,
              right: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  product.name,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: context.bodySmall.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Opens the bottom sheet with the product details.
  void _showProductDetails(ProductModel product) {
    Get.bottomSheet(HomeProductDetailsSheet(product: product)).then((v) {
      audioController.pauseAudio();
    });
  }
}
