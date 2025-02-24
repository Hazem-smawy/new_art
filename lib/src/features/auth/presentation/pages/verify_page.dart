import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/extensions/padding_extension.dart';
import 'package:newart/src/features/auth/presentation/getX/verify_controller.dart';
import 'package:newart/src/features/auth/presentation/widgets/auth_image_widget.dart';

class VerifyEmailPage extends StatelessWidget {
  final VerifyEmailController _controller = Get.find()
    ..checkInitialEmailVerificationStatus();

  VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.whiteColor,
        body: SafeArea(
          child: SizedBox(
            height: context.height,
            width: double.infinity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  const AuthImageWidget(),
                  context.g20,
                  Text(
                    'تم ارسال رسالة للايميل يرجى التحقق من ايميلك واعادة الدخول',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ).ph(20),
                  context.g12,
                  Obx(() => ElevatedButton(
                        onPressed: _controller.canResendEmail.value
                            ? _controller.sendVerificationEmail
                            : null,
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
                      )),
                  context.g4,
                  ElevatedButton(
                    onPressed: _controller.signOut,
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
                  const Spacer(),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      );
}
// import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class VerifyEmailPage extends StatefulWidget {
//   const VerifyEmailPage({super.key});

//   @override
//   State<VerifyEmailPage> createState() => _VerifyEmailPageState();
// }

// class _VerifyEmailPageState extends State<VerifyEmailPage> {
//   bool isEmailVerified = false;
//   Timer? timer;
//   bool canResendEmail = true;

//   @override
//   void initState() {
//     super.initState();
//     isEmailVerified = FirebaseAuth.instance.currentUser?.emailVerified ?? false;

//     if (!isEmailVerified) {
//       sendVerificationEmail();
//       timer = Timer.periodic(
//         const Duration(seconds: 3),
//         (_) => checkEmailVerified(),
//       );
//     }
//   }

//   Future<void> sendVerificationEmail() async {
//     if (!canResendEmail) return;

//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         await user.sendEmailVerification();
//         setState(() {
//           canResendEmail = false;
//         });

//         // Enable resend after a delay
//         await Future.delayed(const Duration(seconds: 5));
//         setState(() {
//           canResendEmail = true;
//         });
//       }
//     } catch (e) {
//       Get.snackbar("Error", "Failed to send verification email: $e");
//     }
//   }

//   Future<void> checkEmailVerified() async {
//     await FirebaseAuth.instance.currentUser?.reload();
//     setState(() {
//       isEmailVerified =
//           FirebaseAuth.instance.currentUser?.emailVerified ?? false;
//     });

//     if (isEmailVerified) {
//       timer?.cancel();
//       Get.back(); // Navigate back to the previous screen
//     }
//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         backgroundColor: Colors.white,
//         body: SafeArea(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Spacer(),
//                 const Text(
//                   'تم ارسال رسالة للايميل يرجى التحقق من ايميلك واعادة الدخول',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: canResendEmail ? sendVerificationEmail : null,
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     backgroundColor: canResendEmail ? Colors.blue : Colors.grey,
//                   ),
//                   child: const Text('إعادة إرسال'),
//                 ),
//                 const SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: () async {
//                     await FirebaseAuth.instance.signOut();
//                     Get.back(); // Navigate back on cancel
//                   },
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       side: const BorderSide(color: Colors.grey),
//                     ),
//                     backgroundColor: Colors.transparent,
//                     elevation: 0,
//                   ),
//                   child: const Text(
//                     'إلغاء',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ),
//                 const Spacer(),
//               ],
//             ),
//           ),
//         ),
//       );
// }
