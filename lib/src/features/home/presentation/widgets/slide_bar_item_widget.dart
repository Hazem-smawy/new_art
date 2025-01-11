import 'package:flutter/material.dart';
import 'package:new_art/src/core/extensions/context_extensions.dart';

class SlideBarItemWidget extends StatelessWidget {
  final String title;
  final VoidCallback action;
  final IconData icon;
  const SlideBarItemWidget({
    super.key,
    required this.title,
    required this.action,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        action();
      },
      child: Container(
        // color: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 40),
        child: Transform.rotate(
          angle: -3.14 / 2, // Rotate 45 degrees (in radians)
          child: Column(
            children: [
              // Icon(Icons.music_note),
              Text(
                title,
                softWrap: false,
                overflow: TextOverflow.visible,
                style: context.titleLarge.copyWith(
                  color: context.secondaryTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
