import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/extensions/padding_extension.dart';
import 'package:newart/src/features/auth/presentation/getX/auth_controller.dart';
import 'package:newart/src/features/auth/presentation/widgets/auth_back_btn_widget.dart';
import 'package:newart/src/features/auth/presentation/widgets/auth_image_widget.dart';

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
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Form(
                    key: authController.recovertPasswordFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Get.height / 8,
                        ),
                        AuthImageWidget(),
                        Text(
                          "التحقق من البريد الإلكتروني",
                          style: context.displayMedium,
                        ),
                        context.g4,
                        Text(
                          'سيتم ارسال رسالة الى بريدك الألكتوني قم بالضعط علية وتغير كلمة الموروو وقم ب  تسجيل الدخول من جديد',
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: context.bodySmall,
                        ).ph(20),
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
}

class CustomBtnWithIconWidget extends StatelessWidget {
  final title;
  final VoidCallback action;
  const CustomBtnWithIconWidget(
      {super.key, required this.title, required this.action});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => action(),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: context.secondary,
        minimumSize: const Size.fromHeight(50),
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: context.titleMedium.copyWith(
              color: context.whiteColor,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.lock_open,
            size: 20,
            color: context.whiteColor,
          ),
        ],
      ),
    );
  }
}
