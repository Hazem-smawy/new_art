import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_art/src/core/extensions/context_extensions.dart';
import 'package:new_art/src/core/extensions/padding_extension.dart';
import 'package:new_art/src/core/routes/app_pages.dart';

import '../../../../core/widgets/header_widget.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      floatingActionButton: FloatingActionButton(
        isExtended: false,
        onPressed: () {
          // Add your onPressed code here!
          print('Floating Action Button Pressed');
        },
        backgroundColor: context.primary,
        elevation: 0,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(20),
        // ),
        child: Icon(
            Icons.add_shopping_cart_outlined), // Background color of the FAB
      ),
      body: SafeArea(
          child: Column(
        children: [
          HeaderWidget(
            title: 'السلة',
            leftWidget: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.ALL_ORDER);
              },
              child: Icon(
                Icons.all_inbox_outlined,
                color: context.secondaryTextColor,
              ).ph(16),
            ),
            // leftIcon: Icons.all_inbox,
            // leftAction: () {},
          ),
          Column(
            children: [
              SizedBox(
                height: context.height / 7,
              ),
              Image.asset(
                'assets/images/empty.png',
                width: 200,
              ),
              Text(
                'ليس هناك اي طلبات في السلة لإضافة طلب جديد قم ب الضغط على طلب جديد لو لطلب طلب نوجود سابقا قم ب الصغط على الطلبات السابقة',
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: context.bodyLarge,
              ).ph(30),
              context.g56,
              SizedBox(
                width: context.width / 3,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      context.secondary,
                    ),
                    side: WidgetStateProperty.all(
                      BorderSide(
                        color: context.secondaryTextColor.withAlpha(60),
                        width: 1,
                      ), // Outline color and width
                    ),
                    foregroundColor: WidgetStateProperty.all(
                      context.blackColor,
                    ), // Icon color
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.TRACK_ORDER);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'تتبع الطلبات',
                        style: context.bodyMedium.copyWith(
                          color: context.whiteColor,
                        ),
                      ),
                      context.g12,
                      Icon(
                        Icons.timeline_outlined,
                        color: context.whiteColor,
                      )
                    ],
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'الطلبات السابقة',
                    style: context.bodyMedium,
                  ))
            ],
          ),
        ],
      )),
    );
  }
}
