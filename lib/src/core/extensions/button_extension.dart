import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/spaces_sizes.dart';

extension ButtonExtension on ElevatedButton {
  Widget status(bool loading) {
    if (!loading) return this;
    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: Spaces.sp16,
          vertical: Spaces.sp8,
        ),
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: AppColors.containerColor.withOpacity(0.5),
          ),
        ),
      ),
      child: const SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
