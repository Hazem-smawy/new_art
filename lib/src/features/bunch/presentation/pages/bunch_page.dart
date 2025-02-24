import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/extensions/elvated_btn_extension.dart';
import 'package:newart/src/core/extensions/padding_extension.dart';
import 'package:newart/src/core/types/status_types.dart';
import 'package:newart/src/core/widgets/beautiful_simple_loading.dart';
import 'package:newart/src/core/widgets/error_state_widget.dart';
import 'package:newart/src/core/widgets/header_widget.dart';
import 'package:newart/src/features/bunch/data/models/bunch_model.dart';
import 'package:newart/src/features/bunch/presentation/getX/bunch_controller.dart';
import 'package:newart/src/features/exclusive/presentation/widgets/empty_widget.dart';
// Make sure to import your model file (where Pricing is defined)

class BunchPage extends StatelessWidget {
  BunchPage({super.key});
  final BunchController bunchController = Get.find();

  final images = [
    'assets/images/se.png',
    'assets/images/go.png',
    'assets/images/br.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(title: 'الباقات'),
              context.g16,
              Padding(
                padding: const EdgeInsets.all(16),
                child: Obx(() {
                  switch (bunchController.bunchStatus.value) {
                    case Status.error:
                      return ErrorStateWidget(
                          onRetry: bunchController.fetchBunchData);
                    case Status.loading:
                      return BeautifulSimpleLoading();
                    case Status.initial:
                      return EmptyWidget(action: () {});
                    case Status.success:
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: bunchController.bunchData.value!.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          final pricing =
                              bunchController.bunchData.value!.data[index];
                          return BunchItemWidget(
                            pricing: pricing,
                            image: images[index],
                          );
                        },
                      );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BunchItemWidget extends StatelessWidget {
  final Pricing pricing;
  final String image;
  const BunchItemWidget({
    super.key,
    required this.pricing,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final featuresList = pricing.featuresEn
        .split('\n')
        .map((feature) => feature.trim())
        .where((feature) => feature.isNotEmpty)
        .toList();
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 0,
          child: Image.asset(
            image,
            // height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(30),
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            border: Border.all(color: context.secondaryTextColor.withAlpha(50)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Display package name from the model
              Text(
                pricing.name,
                style: context.titleMedium,
              ),
              context.g8,
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Spacer(),
                  // You can adjust the label based on the currency or pricing type
                  Text(
                    'ر.س/شهر',
                    style: context.bodySmall,
                  ),
                  context.g4,
                  // Display the price
                  Text(
                    '${pricing.price}',
                    style: context.displayLarge,
                  ),
                ],
              ),
              context.g8,
              // Display package details
              Text(
                pricing.details,
                style: context.bodySmall.copyWith(
                  color: context.blackColor,
                ),
              ),
              context.g20,
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'المميزات',
                  style: context.displayLarge,
                ),
              ),
              // Optionally display the features; here we’re just showing them in one widget.
              // You can also split the features string by newline or a specific delimiter to create multiple feature items.
              ...featuresList.map((e) => BunchItemFeatureWidget(title: e)),

              // Display any other related info
              BunchItemFeatureWidget(
                title: 'أخرى: ${pricing.other}',
              ),
              context.g28,
              ElevatedButtonExtension.primary(
                  label: 'الحصول على الباقة', onPressed: () {}),
            ],
          ),
        ),
      ],
    );
  }
}

class BunchItemFeatureWidget extends StatelessWidget {
  final String title;
  const BunchItemFeatureWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          title,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          style: context.bodyMedium.copyWith(
            color: context.blackColor,
          ),
        ),
        context.g12,
        Icon(
          Icons.check,
          size: 17,
          color: context.secondaryTextColor,
        ),
      ],
    ).pt(
      12,
    );
  }
}
