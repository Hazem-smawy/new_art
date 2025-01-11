import 'package:new_art/src/core/constants/colors.dart';
import 'package:new_art/src/core/constants/text_style.dart';
import 'package:new_art/src/core/widgets/thin_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CustomDialog {
  // static void customSnackBar(
  //     description, SnackPosition? snackPosition, bool isError) {
  //   Get.closeAllSnackbars();
  //   Get.rawSnackbar(
  //     backgroundColor: AppColors.blackColor.withOpacity(0.9),
  //     //duration: const Duration(seconds: 10),
  //     snackPosition: snackPosition ?? SnackPosition.TOP,
  //     messageText: Text(
  //       description,
  //       textAlign: TextAlign.right,
  //       style: AppTextStyle.titleMedium.copyWith(
  //         color: Colors.white,
  //         fontSize: 12,
  //         fontWeight: FontWeight.normal,
  //       ),
  //     ),
  //     icon: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  //       child: FaIcon(
  //         isError ? FontAwesomeIcons.xmark : FontAwesomeIcons.check,
  //         color: AppColors.bg,
  //         size: 25,
  //       ),
  //     ),
  //     margin: const EdgeInsets.all(10),
  //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  //     borderRadius: 12,
  //   );
  static void showDialog({title, description, icon, color, action}) {
    Get.defaultDialog(
      title: "",
      // titleStyle: MyTextStyles.body,
      titlePadding: const EdgeInsets.all(0),
      middleTextStyle: AppTextStyle.bodyLarge,
      contentPadding: const EdgeInsets.all(5),
      backgroundColor: AppColors.whiteColor,
      middleText:
          "تعني المحاسبة تتبع جميع المعاملات المالية المتعلقة بالعمل، والتي تتضمن تبويب المدخلات وتسجيلها وتلخيصها وتحليلها وإبلاغ ",
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 50,
                ),

                const SizedBox(height: 12),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.displayLarge,
                ),
                // SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.bodyMedium,
                  ),
                ),
                const SizedBox(height: 16),
                const ThinDividerWidget(),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        minimumSize: const Size.fromHeight(44),
                        backgroundColor: color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        action();
                      },
                      child: Text(
                        "موافق",
                        style: AppTextStyle.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                ),
              ],
            ),
          ),
          const Positioned(
            left: 0,
            bottom: 0,
            child: LottieWidget(),
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: -50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.xmark,
                  size: 15,
                  color: AppColors.containerColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  static void customSnackBar(
      description, SnackPosition? snackPosition, bool? isError) {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
      return;
    }
    Get.rawSnackbar(
      borderColor: AppColors.secondaryColor.withAlpha(50),
      backgroundColor: AppColors.whiteColor,
      snackPosition: snackPosition ?? SnackPosition.TOP,
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              description,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontFamily: "Cairo",
                color: AppColors.blackColor,
                fontSize: 10,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 5,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isError ?? true ? Colors.red : Colors.green,
            ),
          )
        ],
      ),
      icon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: FaIcon(
          isError ?? true
              ? FontAwesomeIcons.circleXmark
              : FontAwesomeIcons.circleCheck,
          color: isError ?? true ? Colors.red : Colors.green,
          size: 25,
        ),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      borderRadius: 12,
    );
  }
  // Get.snackbar("", "",
  //     barBlur: 0,
  //     overlayBlur: 0,
  //     snackPosition: SnackPosition.BOTTOM,
  //     isDismissible: false,
  //     margin: const EdgeInsets.all(10),
  //     backgroundColor: MyColors.lessBlackColor,
  //     padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
  //     duration: const Duration(seconds: 5),
  //     titleText: Text(
  //       "جميع المعاملات المالية ",
  //       textAlign: TextAlign.right,
  //       style: MyTextStyles.subTitle.copyWith(
  //         color: Colors.white,
  //       ),
  //     ),
  //     messageText: Padding(
  //       padding: const EdgeInsets.only(bottom: 5),
  //       child: Text("تعني المحاسبة تتبع جميع المعاملات المالية   ",
  //           textAlign: TextAlign.right,
  //           style: MyTextStyles.body.copyWith(
  //             color: MyColors.containerColor,
  //           )),
  //     ),
  //     snackStyle: SnackStyle.FLOATING,
  //     shouldIconPulse: true,
  //     icon: const Padding(
  //       padding: EdgeInsets.symmetric(horizontal: 15),
  //       child: FaIcon(
  //         FontAwesomeIcons.check,
  //         color: MyColors.containerSecondColor,
  //         size: 25,
  //       ),
  //     ));

  // static void showDialog({title, description, icon, color, action}) {
  //   Get.defaultDialog(
  //     title: "",
  //     titleStyle: AppTextStyle.titleSmall,
  //     middleTextStyle: AppTextStyle.bodyLarge,
  //     contentPadding: const EdgeInsets.all(20),
  //     middleText:
  //         "تعني المحاسبة تتبع جميع المعاملات المالية المتعلقة بالعمل، والتي تتضمن تبويب المدخلات وتسجيلها وتلخيصها وتحليلها وإبلاغ ",
  //     content: Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         //Icon(Icons.dele),
  //         FaIcon(
  //           icon,
  //           color: AppColors.secondaryTextColor,
  //           size: 50,
  //         ),
  //         const SizedBox(height: 20),
  //         Text(title,
  //             textAlign: TextAlign.center,
  //             style: AppTextStyle.titleMedium.copyWith(
  //               fontWeight: FontWeight.bold,
  //               fontSize: 22,
  //               color: color,
  //             )),
  //         // SizedBox(height: 10),
  //         Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 50),
  //           child: Text(
  //             description,
  //             textAlign: TextAlign.center,
  //             style: AppTextStyle.bodySmall,
  //           ),
  //         ),
  //         const SizedBox(height: 15),
  //       ],
  //     ),
  //     cancel: ElevatedButton(
  //         style: ElevatedButton.styleFrom(
  //           elevation: 0,
  //           minimumSize: const Size.fromHeight(50),
  //           backgroundColor: color,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(12),
  //           ),
  //         ),
  //         onPressed: () {
  //           action();
  //         },
  //         child: Text(
  //           "موافق",
  //           style: AppTextStyle.titleMedium.copyWith(color: Colors.white),
  //         )),
  //     confirm: Padding(
  //       padding: const EdgeInsets.only(bottom: 20, top: 3),
  //       child: GestureDetector(
  //         onTap: () => Get.back(),
  //         child: Text(
  //           "الغاء",
  //           style: AppTextStyle.titleSmall.copyWith(
  //             color: AppColors.secondaryTextColor,
  //             fontWeight: FontWeight.normal,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  static void loadingProgress() {
    Get.defaultDialog(
      title: "...يرجي الإ نتضار",
      middleText: "",
      titleStyle: AppTextStyle.titleSmall,
      barrierDismissible: false,
      radius: 15,
      titlePadding: const EdgeInsets.all(10),
      // custom: Center(child: CircularProgressIndicator()),
      backgroundColor: AppColors.bg.withAlpha(180),
      content: Container(
        constraints: BoxConstraints(
          maxHeight: Get.height / 5,
          maxWidth: Get.width - 50,
        ),
        child: const Center(
            child: CircularProgressIndicator(
          backgroundColor: AppColors.bg,
          color: AppColors.blackColor,
        )),
      ),
    );
  }
}

class LottieWidget extends StatefulWidget {
  const LottieWidget({super.key});

  @override
  State<LottieWidget> createState() => _LottieWidgetState();
}

class _LottieWidgetState extends State<LottieWidget> {
  late final Future<LottieComposition> _composition;

  @override
  void initState() {
    super.initState();

    _composition = AssetLottie(
      'assets/lottie/lottie_win.json',
    ).load();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LottieComposition>(
      future: _composition,
      builder: (context, snapshot) {
        var composition = snapshot.data;
        if (composition != null) {
          return Lottie(
            composition: composition,
            width: Get.width - 100,
            height: Get.height / 3.3,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
