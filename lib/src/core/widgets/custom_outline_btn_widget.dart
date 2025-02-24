import 'package:flutter/material.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';

class CustomOutlineBtnWidget extends StatelessWidget {
  final VoidCallback action;
  final String title;

  const CustomOutlineBtnWidget({
    super.key,
    required this.title,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => action(),
      child: Container(
        //margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(7),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: context.secondaryTextColor.withAlpha(50),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: context.blackColor),
          ),
        ),
      ),
    );
  }
}
