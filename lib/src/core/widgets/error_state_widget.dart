import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/extensions/elvated_btn_extension.dart';
import 'package:newart/src/core/extensions/padding_extension.dart';

class ErrorStateWidget extends StatelessWidget {
  final VoidCallback onRetry;
  final String errorMessage;
  final String imageAsset;

  const ErrorStateWidget({
    super.key,
    required this.onRetry,
    this.errorMessage = 'واجهنا مشكلة، يرجى التحقق من اتصالك بالإنترنت!',
    this.imageAsset =
        'assets/images/error.png', // تأكد من وجود هذا المسار في pubspec.yaml
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: context.whiteColor,
        ),
        padding: const EdgeInsets.all(28),
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // عرض صورة الخطأ
            Image.asset(
              imageAsset,
              width: context.width,
              // height: 150,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            // نص رسالة الخطأ
            Text(
              errorMessage,
              style: context.titleMedium,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // زر إعادة المحاولة
            ElevatedButtonExtension.error(
              label: 'إعادة المحاولة',
              onPressed: onRetry,
            ).ph(32)
          ],
        ),
      ),
    );
  }
}
