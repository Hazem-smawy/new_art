import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/routes/app_pages.dart';

class HomwServiceWidget extends StatelessWidget {
  const HomwServiceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView(
        reverse: true,
        scrollDirection: Axis.horizontal,
        children: [
          // context.g16,

          // const Spacer(),
          HomeServiceItemWidget(
              icon: Icons.music_note_outlined,
              isSelected: false,
              smallIcon: false,
              label: 'اعمالنا الحصرية',
              action: () {
                Get.toNamed(Routes.PRODUCTS);
              }),
          context.g8,

          HomeServiceItemWidget(
            action: () {
              Get.toNamed(Routes.ALL_ARTISTS);
            },
            icon: Icons.spatial_audio_outlined,
            isSelected: false,
            smallIcon: false,
            label: 'اكبر الفنانين',
          ),
          context.g8,

          // HomeServiceItemWidget(
          //   icon: FontAwesomeIcons.message,
          //   isSelected: false,
          //   smallIcon: false,
          //   label: 'تواصل معنا',
          //   action: () {},
          // ),
        ],
      ),
    );
  }
}

class HomeServiceItemWidget extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback action;
  final bool smallIcon;
  final String label;
  const HomeServiceItemWidget({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.smallIcon,
    required this.action,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        action();
      },
      child: Container(
        // height: 55,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: context.secondaryTextColor.withAlpha(50),
          ),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: context.bodyLarge.copyWith(
                color: context.secondaryTextColor,
              ),
            ),
            context.g8,
            Center(
              child: FaIcon(
                icon,
                size: 20,
                color: context.secondaryTextColor,

                // color: context.secondaryTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
