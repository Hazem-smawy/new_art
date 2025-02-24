import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/helpers/validation.dart';
import 'package:newart/src/features/auth/presentation/getX/auth_controller.dart';
import 'package:newart/src/features/auth/presentation/pages/recover_password_page.dart';
import 'package:newart/src/features/auth/presentation/widgets/auth_back_btn_widget.dart';
import 'package:newart/src/features/auth/presentation/widgets/auth_text_fieldwidget.dart';
import 'package:newart/src/features/auth/presentation/widgets/login_with_google_widget.dart';
import 'package:newart/src/features/auth/presentation/widgets/social_medial_widget.dart';

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
                    padding: const EdgeInsets.all(20),
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
                          Text(
                            "أنشاء حساب",
                            style: context.displayMedium,
                          ),
                          context.g28,
                          AuthTextFieldwidget(
                            icon: FontAwesomeIcons.user,
                            hint: 'الأسم',
                            type: TextInputType.name,
                            validator: (value) => validInput(
                              value ?? '',
                              2,
                              30,
                              'firstName',
                            ),
                            controller: authController.firstNameController,
                          ),
                          // context.g16,
                          // AuthTextFieldwidget(
                          //   controller: authController.secondNameController,
                          //   icon: FontAwesomeIcons.user,
                          //   hint: 'الأسم الثاني',
                          //   validator: (value) =>
                          //       validInput(value ?? '', 2, 10, 'lastName'),
                          // ),
                          context.g16,
                          AuthTextFieldwidget(
                            controller: authController.emailController,
                            icon: FontAwesomeIcons.envelope,
                            type: TextInputType.emailAddress,
                            hint: 'البريد الإلكتروني',
                            lan: 'ar',
                            validator: (value) => validInput(
                              value ?? '',
                              2,
                              30,
                              'email',
                            ),
                          ),
                          context.g16,
                          // AuthTextFieldwidget(
                          //   controller: authController.usernameController,
                          //   icon: FontAwesomeIcons.globe,
                          //   hint: 'اسم المستخدم',
                          //   validator: (value) =>
                          //       validInput(value ?? '', 2, 10, 'username'),
                          // ),
                          // context.g16,
                          AuthTextFieldwidget(
                            controller: authController.phoneController,
                            icon: FontAwesomeIcons.phone,
                            hint: 'رقم الهاتف',
                            type: TextInputType.phone,
                            validator: (value) => validInput(
                              value ?? '',
                              2,
                              30,
                              'phone',
                            ),
                          ),
                          context.g16,
                          AuthTextFieldwidget(
                            controller: authController.passwordController,
                            icon: FontAwesomeIcons.lock,
                            hint: 'كلمة السر',
                            isPassword: true,
                            validator: (value) => validInput(
                              value ?? '',
                              2,
                              30,
                              'password',
                            ),
                          ),
                          context.g20,
                          CustomBtnWithIconWidget(
                            title: 'أنشاء حساب',
                            action: () {
                              authController.signUp();
                            },
                          ),
                          context.g12,
                          LoginWithGoogleWidget(),
                          context.g16,
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
                                  style: context.bodyLarge.copyWith(
                                    color: context.blackColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                          context.g20,

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
