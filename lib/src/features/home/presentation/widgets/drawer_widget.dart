// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/extensions/padding_extension.dart';
import 'package:newart/src/core/routes/app_pages.dart';
import 'package:newart/src/features/auth/presentation/getX/auth_controller.dart';

class MyDrawerWidget extends StatelessWidget {
  MyDrawerWidget({
    super.key,
  });
  AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: SizedBox(
                width: double.infinity,
                // color: AppColors.secondaryColor,
                child: Stack(
                  children: [
                    SafeArea(
                      child: Column(
                        children: [
                          context.g36,
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: SvgPicture.asset(
                                'assets/images/logonav.svg',
                                // width: 70,
                                // height: 70,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  children: [
                    Obx(
                      () => authController.currentUser.value != null &&
                              (authController
                                      .currentUser.value?.emailVerified ??
                                  false)
                          ? DrawerProfileShowItemWidget()
                          : GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.AUTH);
                              },
                              child: DrawerLoginItemWidget(),
                            ),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          DrawerItemWidget(
                              title: "الفنانين",
                              icon: Icons.person_2_outlined,
                              action: () {
                                Get.toNamed(Routes.ALL_ARTISTS);
                              }),
                          // ThinDividerWidget(),
                          DrawerItemWidget(
                            title: "الطلبات",
                            icon: Icons.shopping_bag_outlined,
                            action: () {
                              Get.toNamed(Routes.TRACK_ORDER);
                            },
                          ),
                          DrawerItemWidget(
                              title: "احدث الأعمال",
                              icon: Icons.timer_outlined,
                              action: () {
                                Get.toNamed(Routes.PRODUCTS);
                              }),
                          DrawerItemWidget(
                            title: "الإعدادات",
                            icon: Icons.settings_outlined,
                            action: () {},
                          ),
                          DrawerItemWidget(
                            title: "من نحن",
                            icon: Icons.info_outline,
                            action: () {},
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const SizedBox(
                            // width: MediaQuery.of(context).size.width * 0.6,
                            child: Row(
                              children: [
                                Spacer(),
                                SocialIconWidget(
                                  icon: FontAwesomeIcons.whatsapp,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                SocialIconWidget(
                                  icon: FontAwesomeIcons.instagram,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                SocialIconWidget(
                                  icon: Icons.phone_enabled_outlined,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                SocialIconWidget(
                                  icon: FontAwesomeIcons.twitter,
                                ),
                              ],
                            ),
                          ),
                          context.g12,
                          context.g56,
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            if (authController.currentUser.value != null &&
                (authController.currentUser.value?.emailVerified ?? false))
              DrawerItemWidget(
                title: "تسجيل الخووج",
                icon: Icons.logout,
                action: () async {
                  await authController.logOut();
                },
              ).pr(24),
            context.g20,
          ],
        ),
      ),
    );
  }
}

class DrawerProfileShowItemWidget extends StatelessWidget {
  DrawerProfileShowItemWidget({
    super.key,
  });

  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.USER);
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: context.secondaryTextColor.withAlpha(50),
          ),
        ),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: context.blackColor,
                ),
                child: Row(
                  children: [
                    Text(
                      'ترقية',
                      style: context.bodySmall.copyWith(
                        color: context.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text(
                authController.userDetails.value?.firstName ?? '',
                style: context.bodyLarge,
              ),
              context.g8,
              CircleAvatar(
                radius: 13,
                backgroundColor: context.secondary,
                backgroundImage:
                    authController.userDetails.value?.imageURL != null
                        ? NetworkImage(
                            authController.userDetails.value?.imageURL ?? '',
                          ) as ImageProvider
                        : null,
                foregroundImage: authController.userDetails.value?.imageURL !=
                        null
                    ? NetworkImage(authController.userDetails.value!.imageURL!)
                    : null,
                child: authController.userDetails.value?.imageURL == null
                    ? Icon(
                        Icons.person, // Placeholder icon
                        size: 16,
                        color: Colors.white,
                      )
                    : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerLoginItemWidget extends StatelessWidget {
  const DrawerLoginItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: context.secondary,
              ),
              child: Center(
                child: Text(
                  'تسجيل الدخول',
                  style: context.bodyLarge.copyWith(
                    color: context.whiteColor,
                  ),
                ),
              ),
            ),
          ),
          context.g12,
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: context.secondaryTextColor.withAlpha(
                    50,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  'إنشاء حساب',
                  style: context.bodyLarge,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SocialIconWidget extends StatelessWidget {
  final IconData icon;
  const SocialIconWidget({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: context.containerColor,
        border: Border.all(
          color: context.secondaryTextColor.withAlpha(50),
        ),
      ),
      child: FaIcon(
        icon,
        size: 20,
        color: Get.isDarkMode
            ? Theme.of(context).colorScheme.primaryContainer.withAlpha(180)
            : Theme.of(context).hintColor,
      ),
    );
  }
}

class DrawerItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback action;
  const DrawerItemWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        action();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        padding: const EdgeInsets.only(top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: context.bodyMedium.copyWith(color: context.blackColor),
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 25,
              child: Icon(
                icon,
                size: 20,
                color: context.blackColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
