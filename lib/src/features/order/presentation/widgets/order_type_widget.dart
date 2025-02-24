import 'package:flutter/material.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';

class OrderTypeWidget extends StatelessWidget {
  const OrderTypeWidget({
    super.key,
    required this.status,
    required this.color,
  });

  final Color color;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color.withAlpha(20),
        ),
        child: Text(
          status,
          style: context.bodySmall.copyWith(
            color: color,
          ),
        ),
      ),
    );
  }
}
