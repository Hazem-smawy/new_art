import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/extensions/padding_extension.dart';
import 'package:newart/src/core/routes/app_pages.dart';

class OrderInitialWidget extends StatelessWidget {
  const OrderInitialWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
              Get.toNamed(Routes.ADD_ORDER);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'إضافة طلب',
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
      ],
    );
  }
}
