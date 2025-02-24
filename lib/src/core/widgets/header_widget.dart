import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/extensions/padding_extension.dart';
import 'package:newart/src/core/widgets/circle_back_btn_widget.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.title, this.leftWidget});
  final Widget? leftWidget;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leftWidget == null
            ? const SizedBox(
                width: 40,
              )
            : leftWidget!,
        // const Spacer(),
        Text(
          title,
          style: context.titleLarge,
        ),
        // Spacer(),
        const CircleBackBtnWidget()
      ],
    ).pt(10).pr(5);
  }
}
