// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/features/auth/presentation/getX/auth_controller.dart';

class LoginWithGoogleWidget extends StatelessWidget {
  LoginWithGoogleWidget({
    super.key,
  });

  final AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        authController.signInWithGoogle();
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            30,
          ),
          border: Border.all(color: context.secondaryTextColor.withAlpha(50)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'تسجيل الدخول بإستخدام جوجل',
              style: context.titleMedium,
            ),
            SizedBox(
              width: 20,
            ),
            FaIcon(
              FontAwesomeIcons.google,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
