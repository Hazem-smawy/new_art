import 'package:new_art/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              //Get.back();
            },
            icon: Icon(
              Icons.more_vert_rounded,
              size: 27,
              color: context.secondaryTextColor,
            ),
          ),
          Text(
            title,
            style: context.bodyLarge,
          ),
          const MyCustomBackBtnWiget(),
        ],
      ),
    );
  }
}

class MyCustomBackBtnWiget extends StatelessWidget {
  const MyCustomBackBtnWiget({
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
        border: Border.all(
          color: context.secondaryTextColor.withAlpha(50),
        ),
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
