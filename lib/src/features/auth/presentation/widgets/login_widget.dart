// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:new_art/src/core/extensions/context_extensions.dart';
import 'package:new_art/src/core/helpers/validation.dart';
import 'package:new_art/src/features/auth/presentation/getX/auth_controller.dart';
import 'package:new_art/src/features/auth/presentation/pages/recover_password_page.dart';
import 'package:new_art/src/features/auth/presentation/widgets/auth_back_btn_widget.dart';
import 'package:new_art/src/features/auth/presentation/widgets/auth_text_fieldwidget.dart';
import 'package:new_art/src/features/auth/presentation/widgets/social_medial_widget.dart';

class LoginWidget extends StatelessWidget {
  final VoidCallback onClickedSignUp;

  LoginWidget({super.key, required this.onClickedSignUp});

  final AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: SafeArea(
          child: Stack(
            children: [
              Form(
                key: authController.loginFormKey,
                child: Container(
                  padding: const EdgeInsets.all(40),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            height: 200,
                            // color: MyColors.darkBackgroundColor,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: SvgPicture.asset(
                                'assets/images/logonav.svg',
                                // width: 70,
                                // height: 70,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Text("تسجيل الدخول", style: context.titleLarge),
                        context.g28,
                        AuthTextFieldwidget(
                          controller: authController.emailController,
                          icon: FontAwesomeIcons.envelope,
                          hint: 'البريد الإلكتروني',
                          validator: (value) =>
                              validInput(value ?? '', 2, 20, 'email'),
                        ),
                        context.g12,
                        AuthTextFieldwidget(
                          controller: authController.passwordController,
                          icon: FontAwesomeIcons.lock,
                          hint: 'كلمة السر',
                          validator: (value) =>
                              validInput(value ?? '', 2, 20, 'password'),
                        ),
                        context.g12,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              child: Text(
                                "نسيت كلمة المرور ",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              onTap: () {
                                Get.to(() => const ForgotPasswordPage());
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomBtnWithIconWidget(
                          title: 'تسجيل الدخول',
                          action: () {
                            authController.login();
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          textDirection: TextDirection.rtl,
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodyMedium,
                            text: ' لا يوجد حساب ؟ ',
                            children: [
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = onClickedSignUp,
                                  text: 'انشاء حساب',
                                  style: Theme.of(context).textTheme.bodyLarge)
                            ],
                          ),
                        ),
                        context.g28,
                        SocialMedialWidget(),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const AuthBackBtnWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Future SignIn() async {
    //dialog
    // try {
    //   await FirebaseAuth.instance.signInWithEmailAndPassword(
    //     email: emailController.text.trim(),
    //     password: passwordController.text.trim(),
    //   );
    // } on FirebaseAuthException {
    //   // Utils.showSnackBar(e.message);
    // }
    // Get.back();
  }
}
