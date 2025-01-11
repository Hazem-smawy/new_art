import 'package:new_art/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CustomOutLineBtnWidget extends StatelessWidget {
  const CustomOutLineBtnWidget({
    super.key,
    required this.label,
    required this.action,
  });
  final String label;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        action();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: context.primaryColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: context.containerColor.withAlpha(120),
          ),
        ),
        minimumSize: const Size.fromHeight(40),
      ),
      child: Text(
        label,
        style: context.titleLarge.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
