import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:new_art/src/core/extensions/context_extensions.dart';
import 'package:new_art/src/core/extensions/padding_extension.dart';
import 'package:new_art/src/core/widgets/header_widget.dart';
import 'package:new_art/src/features/auth/presentation/widgets/auth_image_widget.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  Timer? timer;
  bool canRestEmail = false;

  @override
  void initState() {
    // isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    isEmailVerified = true;
    if (!isEmailVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(
          const Duration(seconds: 3), (_) => checkEmailVerified());
    }
    // TODO: implement initState
    super.initState();
  }

  Future sendVerificationEmail() async {
    // Get.defaultDialog(
    //     title: '',
    //     backgroundColor: MyColors.bg.withOpacity(0.2),
    //     content: const SizedBox(
    //       width: 200,
    //       height: 200,
    //       child: Center(
    //         child: CircularProgressIndicator(
    //           color: MyColors.primaryColor,
    //           backgroundColor: MyColors.lessBlackColor,
    //         ),
    //       ),
    //     ));
    // try {
    // final user = FirebaseAuth.instance.currentUser!;
    // await user.sendEmailVerification();
    setState(() {
      canRestEmail = false;
    });
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      canRestEmail = true;
    });
    // } on FirebaseAuthException {
    //   // Utils.showSnackBar(e.message);
    // }
    // Get.back();
  }

  Future checkEmailVerified() async {
    // await FirebaseAuth.instance.currentUser!.reload();
    // setState(() {
    //   isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    // });

    if (isEmailVerified) timer?.cancel();
    Get.back();
  }

  @override
  void dispose() {
    timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.whiteColor,
        body: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            // padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HeaderWidget(title: ''),
                  Spacer(),
                  AuthImageWidget(),
                  context.g20,
                  Text(
                    'تم ارسال رسالة للايميل يرجى التحقق من ايميلك واعادة الدخول',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ).ph(20),
                  context.g12,
                  ElevatedButton(
                    onPressed: canRestEmail ? sendVerificationEmail : () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      backgroundColor: context.secondary,
                      minimumSize: const Size(200, 44),
                    ),
                    child: SizedBox(
                      width: 200,
                      child: Center(
                        child: Text(
                          'اعاده ارسال ',
                          style: context.bodyLarge.copyWith(
                            color: context.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  context.g4,
                  ElevatedButton(
                    // onPressed: () => FirebaseAuth.instance.signOut(),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                          color: context.secondaryTextColor.withAlpha(50),
                        ),
                      ),
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      minimumSize: const Size(150, 41),
                    ),
                    child: SizedBox(
                      width: 200,
                      child: Center(
                        child: Text(
                          'الغاء',
                          style: context.bodyLarge.copyWith(
                            color: context.blackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      );
}
