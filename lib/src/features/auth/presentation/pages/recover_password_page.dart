import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:new_art/src/core/extensions/context_extensions.dart';
import 'package:new_art/src/features/auth/presentation/getX/auth_controller.dart';
import 'package:new_art/src/features/auth/presentation/widgets/auth_back_btn_widget.dart';
import 'package:new_art/src/features/auth/presentation/widgets/auth_image_widget.dart';

import '../../../../core/helpers/validation.dart';
import '../widgets/auth_text_fieldwidget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  AuthController authController = Get.find();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(40),
                child: SingleChildScrollView(
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Get.height / 6,
                        ),
                        AuthImageWidget(),
                        Text(
                          "التحقق من البريد الإلكتروني",
                          style: context.titleLarge,
                        ),
                        context.g28,
                        AuthTextFieldwidget(
                          controller: authController.emailController,
                          icon: FontAwesomeIcons.envelope,
                          hint: 'البريد الإلكتروني',
                          validator: (value) =>
                              validInput(value ?? '', 2, 20, 'email'),
                        ),
                        context.g12,
                        CustomBtnWithIconWidget(
                            title: 'التحقق',
                            action: () {
                              authController.recoverPassword();
                            }),
                        context.g12,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const AuthBackBtnWidget(),
          ],
        ),
      ),
    );
  }

  Future resetPassword() async {
    // try {
    //   await FirebaseAuth.instance.sendPasswordResetEmail(
    //     email: emailController.text.trim(),
    //   );

    //   //Utils.showSnackBar('قمنا بارسال رمز التحقق الى بريدك', type: 'info');
    // } on FirebaseAuthException {
    //   // Utils.showSnackBar(e.message);
    // }
    Get.back();
  }
}

class CustomBtnWithIconWidget extends StatelessWidget {
  final title;
  final VoidCallback action;
  const CustomBtnWithIconWidget(
      {super.key, required this.title, required this.action});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => action(),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Theme.of(context).primaryColor,
        minimumSize: const Size.fromHeight(44),
        elevation: 0,
      ),
      icon: const Icon(
        Icons.lock_open,
        size: 18,
      ),
      label: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: context.whiteColor,
            ),
      ),
    );
  }
}
