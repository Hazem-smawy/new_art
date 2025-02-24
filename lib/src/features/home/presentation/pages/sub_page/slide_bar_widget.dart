import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/routes/app_pages.dart';
import 'package:newart/src/features/home/presentation/widgets/main_icon_widget.dart';

import '../../widgets/slide_bar_item_widget.dart';

class SlideBarWidget extends StatelessWidget {
  const SlideBarWidget({super.key, required this.action
      // required this.width,
      });
  // final double width;

  final Function action;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: width,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: context.secondaryTextColor.withAlpha(70),
          ),
        ),
      ),
      child: SizedBox(
        // width: double.infinity,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  action();
                },
                child: const MainIconWidget(
                  icon: Icons.menu_outlined,
                  inHome: false,
                ),
              ),
              context.g20,
              GestureDetector(
                onTap: () {
                  action();
                },
                child: const MainIconWidget(
                  icon: Icons.search_outlined,
                  inHome: false,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(5),
                child: SvgPicture.asset(
                  'assets/images/logonav.svg',
                  width: 70,
                  height: 70,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  // height: Get.height / context.height / 1.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SlideBarItemWidget(
                        title: 'اعمالنا',
                        action: () {
                          Get.toNamed(Routes.PRODUCTS);
                        },
                        icon: FontAwesomeIcons.fileAudio,
                      ),
                      SlideBarItemWidget(
                        icon: FontAwesomeIcons.user,
                        title: 'تتبع الطلب',
                        action: () {
                          Get.toNamed(Routes.TRACK_ORDER);
                        },
                      ),
                      SlideBarItemWidget(
                        title: 'حساباتنا',
                        action: () {
                          Get.toNamed(
                            Routes.OURBANKS,
                          );
                        },
                        icon: FontAwesomeIcons.buildingColumns,
                      ),
                      context.g56,
                      IconButton.outlined(
                        style: ButtonStyle(
                          side: WidgetStateProperty.all(
                            BorderSide(
                              color: context.secondaryTextColor.withAlpha(60),
                              width: 1,
                            ), // Outline color and width
                          ),
                          foregroundColor: WidgetStateProperty.all(
                            context.secondaryTextColor,
                          ), // Icon color
                        ),
                        onPressed: () {
                          Get.toNamed(Routes.CHAT);
                        },
                        icon: Icon(
                          Icons.question_answer_outlined,
                          size: 20,
                        ),
                      ),
                      const SlideBookingNowWidget(),
                      context.g56,
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SlideBookingNowWidget extends StatelessWidget {
  const SlideBookingNowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.ADD_ORDER);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: context.primaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "إضافة\nطلب",
              textAlign: TextAlign.center,
              style: context.bodyLarge.copyWith(
                fontWeight: FontWeight.normal,
                color:
                    !Get.isDarkMode ? context.whiteColor : context.blackColor,
              ),
            ),
            context.g4,
            FaIcon(
              Icons.add_shopping_cart_outlined,
              size: 22,
              color: !Get.isDarkMode ? context.whiteColor : context.blackColor,
            )
          ],
        ),
      ),
    );
  }
}
