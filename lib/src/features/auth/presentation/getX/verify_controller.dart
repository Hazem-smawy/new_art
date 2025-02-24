import 'dart:async';

import 'package:get/get.dart';
import 'package:newart/src/features/auth/domain/usecases/email_verify_usecase.dart';
import 'package:newart/src/features/auth/presentation/getX/auth_controller.dart';

import '../../../../core/utils/dialogs.dart';

class VerifyEmailController extends GetxController {
  AuthController authController = Get.find();
  final VerifyEmailUseCase verifyEmailUseCase;
  var isEmailVerified = false.obs;
  var canResendEmail = true.obs;
  Timer? timer;

  VerifyEmailController({required this.verifyEmailUseCase});

  void checkInitialEmailVerificationStatus() async {
    final result = await verifyEmailUseCase.checkEmailVerified();
    result.fold(
      (failure) => Get.snackbar("Error", failure.message.toString()),
      (isVerified) {
        isEmailVerified.value = isVerified;
        if (!isVerified) {
          sendVerificationEmail();
          startEmailVerificationTimer();
        } else {
          Get.back();
          CustomDialog.customSnackBar(
            'تم تسجيل الدخول بنجاح. مرحبًا بك!',
            SnackPosition.TOP,
            false,
          );
        }
      },
    );
  }

  Future<void> sendVerificationEmail() async {
    if (!canResendEmail.value) return;

    canResendEmail.value = false;
    final result = await verifyEmailUseCase.sendVerificationEmail();
    result.fold(
      (failure) => Get.snackbar("Error", failure.message.toString()),
      (_) {
        // Enable resend after a delay
        Future.delayed(const Duration(seconds: 5), () {
          canResendEmail.value = true;
        });
      },
    );
  }

  void startEmailVerificationTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 3),
      (_) async {
        final result = await verifyEmailUseCase.checkEmailVerified();
        result.fold(
          (failure) => Get.snackbar("Error", failure.message.toString()),
          (isVerified) async {
            isEmailVerified.value = isVerified;

            if (isVerified) {
              timer?.cancel();
              await authController.getUserDetails();
              Get.back(); // Navigate back to the previous screen
            }
          },
        );
      },
    );
  }

  void signOut() async {
    final result = await verifyEmailUseCase.signOut();
    result.fold(
      (failure) => Get.snackbar("Error", failure.message.toString()),
      (_) => Get.back(),
    );
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
