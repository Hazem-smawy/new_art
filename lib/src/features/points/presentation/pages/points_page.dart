import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:new_art/src/core/extensions/context_extensions.dart';
import 'package:new_art/src/core/extensions/padding_extension.dart';
import 'package:new_art/src/core/routes/app_pages.dart';
import 'package:new_art/src/core/widgets/header_widget.dart';

class PointsPage extends StatelessWidget {
  const PointsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderWidget(
              title: 'نقاطي',
            ),
            context.g16,
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.POINTS_STATICS);
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: context.secondary,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_upward,
                          color: Colors.green,
                        ),
                        context.g4,
                        Text(
                          '1000',
                          style: context.displayLarge.copyWith(
                            color: context.whiteColor,
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'النقاط المكتسبة',
                          style: context.displayMedium.copyWith(
                            color: context.whiteColor,
                          ),
                        ),
                      ],
                    ),
                    context.g16,
                    Container(
                      // padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        // border: Border.all(
                        //   color: context.whiteColor.withAlpha(50),
                        // ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.keyboard_arrow_left_outlined,
                            color: context.whiteColor,
                            size: 20,
                          ),
                          context.g8,
                          Text(
                            'التفاصيل',
                            style: context.bodyMedium.copyWith(
                              color: context.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            context.g20,
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'المكافأه',
                style: context.titleLarge,
              ),
            ).pr(16),
            context.g8,
            Stack(
              children: [
                Positioned(
                  left: 10,
                  top: -15,
                  child: Icon(
                    Icons.check,
                    size: 100,
                    color: Colors.green.withAlpha(50),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: context.secondaryTextColor.withAlpha(50),
                    ),
                    // color: Colors.green.withAlpha(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                '100',
                                style: context.displayLarge,
                              ),
                              Text(
                                'نقطة',
                                style: context.bodyLarge.copyWith(
                                  color: context.blackColor,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            'تعديل زفة او شيلة',
                            style: context.titleMedium,
                          ),
                          context.g12,
                          Icon(
                            Icons.star_border_outlined,
                            size: 40,
                            color: const Color.fromARGB(255, 197, 114, 5),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
