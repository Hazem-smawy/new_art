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
import 'package:new_art/src/features/auth/presentation/widgets/login_widget.dart';
import 'package:new_art/src/features/auth/presentation/widgets/social_medial_widget.dart';

class SignUpWidget extends StatelessWidget {
  final Function() onClickedSignUp;
  SignUpWidget({super.key, required this.onClickedSignUp});

  //UserController userController = Get.put(UserController());
  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: SizedBox(
                  // height: MediaQuery.of(context).size.height - 100,
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    child: Form(
                      key: authController.registerFormKey,
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
                          Text("أنشاء حساب", style: context.titleLarge),
                          context.g28,
                          AuthTextFieldwidget(
                            icon: FontAwesomeIcons.user,
                            hint: 'الأسم الاول',
                            validator: (value) =>
                                validInput(value ?? '', 2, 10, 'firstName'),
                            controller: authController.firstNameController,
                          ),
                          context.g16,
                          AuthTextFieldwidget(
                            controller: authController.secondNameController,
                            icon: FontAwesomeIcons.user,
                            hint: 'الأسم الثاني',
                            validator: (value) =>
                                validInput(value ?? '', 2, 10, 'lastName'),
                          ),
                          context.g16,
                          AuthTextFieldwidget(
                            controller: authController.emailController,
                            icon: FontAwesomeIcons.envelope,
                            hint: 'البريد الإلكتروني',
                            validator: (value) =>
                                validInput(value ?? '', 2, 10, 'email'),
                          ),
                          context.g16,
                          AuthTextFieldwidget(
                            controller: authController.usernameController,
                            icon: FontAwesomeIcons.globe,
                            hint: 'اسم المستخدم',
                            validator: (value) =>
                                validInput(value ?? '', 2, 10, 'username'),
                          ),
                          context.g16,
                          AuthTextFieldwidget(
                            controller: authController.phoneController,
                            icon: FontAwesomeIcons.phone,
                            hint: 'رقم الهاتف',
                            validator: (value) =>
                                validInput(value ?? '', 2, 10, 'phone'),
                          ),
                          context.g16,
                          AuthTextFieldwidget(
                            controller: authController.passwordController,
                            icon: FontAwesomeIcons.lock,
                            hint: 'كلمة السر',
                            validator: (value) =>
                                validInput(value ?? '', 2, 10, 'password'),
                          ),
                          context.g20,
                          CustomBtnWithIconWidget(
                              title: 'أنشاء حساب',
                              action: () {
                                authController.signUp();
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                          RichText(
                            textDirection: TextDirection.rtl,
                            text: TextSpan(
                              style: Theme.of(context).textTheme.bodyMedium,
                              text: '  لدي حساب من قبل ؟ ',
                              children: [
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = onClickedSignUp,
                                    text: 'تسجيل الدخول',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge)
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SocialMedialWidget(),
                          const SizedBox(
                            height: 20,
                          ),
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
      ),
    );
  }
}
