import 'package:new_art/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CircleBackBtnWidget extends StatelessWidget {
  const CircleBackBtnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // border: Border.all(
        //   color: context.secondaryTextColor.withAlpha(100),
        // ),
      ),
      child: Center(
        child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            FontAwesomeIcons.chevronRight,
            size: 20,
            color: context.secondaryTextColor,
          ),
        ),
      ),
    );
  }
}
