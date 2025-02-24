import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/widgets/custom_outline_btn_widget.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, required this.action});
  final Function action;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            'assets/images/empty.jpg',
            fit: BoxFit.cover,
          ),
          // context.g20,
          Text(
            'لم تقم بإضافة أي طلب بعد',
            style: context.bodyMedium,
          ),
          context.g12,
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: context.width / 2,
              child: CustomOutlineBtnWidget(
                title: 'اضافة طلب',
                action: () {
                  action();
                },
              ),
            ),
          ),
          context.g16,
        ],
      ),
    );
  }
}
