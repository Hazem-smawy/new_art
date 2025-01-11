import 'package:flutter/material.dart';
import 'package:new_art/src/core/extensions/context_extensions.dart';

class OrderTypeWidget extends StatelessWidget {
  const OrderTypeWidget({
    super.key,
    required this.type,
  });

  final int type;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: type == 2
              ? context.secondary.withAlpha(20)
              : Colors.green.withAlpha(20),
        ),
        child: Text(
          type == 2 ? 'ملغي' : 'تم بنجاح',
          style: context.bodySmall.copyWith(
            color: type == 2 ? context.secondary : Colors.green,
          ),
        ),
      ),
    );
  }
}
