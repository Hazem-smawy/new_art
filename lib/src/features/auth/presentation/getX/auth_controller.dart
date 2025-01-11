// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_art/src/core/usecases/usecases.dart';
import 'package:new_art/src/features/auth/data/models/login_model.dart';
import 'package:new_art/src/features/auth/data/models/user_model.dart';

import 'package:new_art/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:new_art/src/features/auth/domain/usecases/register_usecase.dart';

class AuthController extends GetxController {
  // usecase
  LoginUsecase loginUsecase;
  RegisterUsecase registerUsecase;
  AuthController({
    required this.loginUsecase,
    required this.registerUsecase,
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
  final forgetPasswordFromKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();

  void login() async {
    if (loginFormKey.currentState?.validate() ?? false) {
      final res = await loginUsecase.call(
        Params(
          LoginModel(
            email: emailController.text,
            password: passwordController.text,
          ),
        ),
      );
      res.fold((f) => print(f.message), (r) => print('success login'));
    }
  }

  void signUp() async {
    if (registerFormKey.currentState?.validate() ?? false) {
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
      res.fold((f) => print(f.message), (r) => print('success login'));
    }
  }

  void recoverPassword() {
    print("Recover Password: ${emailController.text}");
  }
}
