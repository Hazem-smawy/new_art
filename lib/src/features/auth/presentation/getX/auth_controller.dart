// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/usecases/usecases.dart';
import 'package:newart/src/core/utils/dialogs.dart';
import 'package:newart/src/features/auth/data/models/login_model.dart';
import 'package:newart/src/features/auth/data/models/user_model.dart';
import 'package:newart/src/features/auth/domain/usecases/current_user_usecase.dart';
import 'package:newart/src/features/auth/domain/usecases/get_user_details_usecase.dart';

import 'package:newart/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:newart/src/features/auth/domain/usecases/recover_password_usecase.dart';
import 'package:newart/src/features/auth/domain/usecases/register_usecase.dart';
import 'package:newart/src/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:newart/src/features/auth/domain/usecases/sign_with_google_usecase.dart';

class AuthController extends GetxController {
  // usecase
  LoginUsecase loginUsecase;
  RegisterUsecase registerUsecase;
  RecoverPasswordUsecase recoverPasswordUsecase;
  CurrentUserUsecase currentUserUsecase;
  SignWithGoogleUsecase signWithGoogleUsecase;
  GetUserDetailsUsecase getUserDetailsUsecase;
  SignOutUsecase signOutUsecase;

  AuthController({
    required this.loginUsecase,
    required this.registerUsecase,
    required this.recoverPasswordUsecase,
    required this.currentUserUsecase,
    required this.signWithGoogleUsecase,
    required this.getUserDetailsUsecase,
    required this.signOutUsecase,
  });

  //controllers
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  final recovertPasswordFormKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();
  final Rx<User?> currentUser = Rx<User?>(null);
  final Rx<UserModel?> userDetails = Rx<UserModel?>(null);

  @override
  void onInit() {
    super.onInit();

    currentUserUsecase.call().listen((user) {
      currentUser.value = user;
      getUserDetails();
    });
  }

  Future<void> getUserDetails() async {
    if (currentUser.value != null) {
      final res =
          await getUserDetailsUsecase.call(Params(currentUser.value?.uid));
      res.fold((_) {}, (r) => userDetails.value = r);
    }
  }

  Future<void> logOut() async {
    if (currentUser.value != null) {
      final res = await signOutUsecase.call();
      res.fold(
          (_) => CustomDialog.customSnackBar(
                'حدث خطأ',
                SnackPosition.TOP,
                true,
              ),
          (r) => CustomDialog.customSnackBar(
                'تم تسجيل الخورج بنجاح. الى القاء !',
                SnackPosition.TOP,
                false,
              ));
    }
  }

  signInWithGoogle() async {
    final res = await signWithGoogleUsecase.call();
    res.fold(
      (_) => CustomDialog.customSnackBar(
        'حدث خطأ',
        SnackPosition.TOP,
        true,
      ),
      (r) => Get.back(),
    );
  }

  void login(BuildContext context) async {
    if (loginFormKey.currentState?.validate() ?? false) {
      // Hide the keyboard
      FocusScope.of(context).unfocus();

      // Show loading dialog
      CustomDialog.loadingProgress();

      // Call the login use case
      final res = await loginUsecase.call(
        Params(
          LoginModel(
            email: emailController.text.trim(),
            password: passwordController.text,
          ),
        ),
      );

      // Handle the result
      res.fold((failure) {
        Get.back(); // Close loading dialog

        // Determine the error message based on failure

        if (failure.message != null) {
          String errorMessage;
          if (failure.message?.contains('No user found') ?? false) {
            errorMessage = 'لا يوجد حساب مسجل بهذا البريد الإلكتروني.';
          } else if (failure.message!.contains('wrong-password')) {
            errorMessage = 'كلمة المرور التي أدخلتها غير صحيحة.';
          } else if (failure.message!.contains('invalid-email')) {
            errorMessage = 'عنوان البريد الإلكتروني غير صالح.';
          } else if (failure.message!.contains('too-many-requests')) {
            errorMessage =
                'تم حظر الحساب مؤقتًا بسبب محاولات تسجيل دخول متعددة. يرجى المحاولة لاحقًا.';
          } else if (failure.message!
              .contains('auth/credential-already-in-use')) {
            errorMessage = 'البيانات المقدمة غير صحيحة أو منتهية الصلاحية.';
          } else {
            errorMessage = failure.message ??
                'unknown failure'; // Use the generic error message
          }
          CustomDialog.customSnackBar(errorMessage, SnackPosition.TOP, false);
        }
        // Show error message
      }, (result) {
        Get.back(); // Close loading dialog

        // Show success message
      });
    }
  }

  Stream<User?> getCurrentUser() {
    return currentUserUsecase.call();
  }

  void signUp() async {
    if (registerFormKey.currentState?.validate() ?? false) {
      CustomDialog.loadingProgress();
      final res = await registerUsecase.call(
        Params(
          UserModel(
            firstName: firstNameController.text,
            lastName: secondNameController.text,
            mobile: phoneController.text,
            username: usernameController.text,
            email: emailController.text,
            password: passwordController.text,
          ),
        ),
      );
      res.fold((f) {
        Get.back();
        // Check for Firebase-specific error codes
        if (f.message?.contains('email-already-in-use') ?? false) {
          CustomDialog.customSnackBar(
            'عنوان البريد الإلكتروني مسجل بالفعل. يرجى استخدام بريد إلكتروني آخر.',
            SnackPosition.TOP,
            true,
          );
        } else if (f.message?.contains('Password should') ?? false) {
          CustomDialog.customSnackBar(
            'كلمة السر يجب ان تكون من 6 ارقام على الاقل .',
            SnackPosition.TOP,
            true,
          );
        } else {
          // Handle other errors
          CustomDialog.customSnackBar(
            'فشل التسجيل',
            SnackPosition.TOP,
            true,
          );
        }
      }, (r) {
        Get.back();
        CustomDialog.customSnackBar(
          'تم التسجيل بنجاح',
          SnackPosition.TOP,
          false,
        );
      });
    }
  }

  Future<void> recoverPassword() async {
    if (recovertPasswordFormKey.currentState?.validate() ?? false) {
      final res =
          await recoverPasswordUsecase.call(Params(emailController.text));
      res.fold(
          (_) => CustomDialog.customSnackBar(
                'حدث خطأ',
                SnackPosition.TOP,
                true,
              ), (_) {
        CustomDialog.customSnackBar(
          'تم إرسال رسالة ال بريدك اللأكتوني ',
          SnackPosition.TOP,
          false,
        );
        Get.back();
      });
    }
  }
}
