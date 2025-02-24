import 'package:flutter/material.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';

class WorkItemIconItemWidget extends StatelessWidget {
  final IconData icon;
  String? label;
  WorkItemIconItemWidget({
    super.key,
    required this.icon,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: context.secondaryTextColor,
          size: 20,
        ),
        context.g4,
        if (label != null)
          Text(
            label!,
            style: context.bodySmall,
          )
      ],
    );
  }
}
