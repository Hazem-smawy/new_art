import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyWidget extends StatelessWidget {
  final String imageName;
  final String label;
  const EmptyWidget({super.key, required this.imageName, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 200,
      width: Get.width - 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        //color: MyColors.bg,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Image.asset(
            imageName,
            fit: BoxFit.cover,
            width: Get.width - 100,
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            label,
            style: context.bodyLarge.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
