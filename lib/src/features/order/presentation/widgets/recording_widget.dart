import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/features/order/presentation/getX/record_controller.dart';

class RecordingWidget extends StatefulWidget {
  const RecordingWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RecordingWidgetState createState() => _RecordingWidgetState();
}

class _RecordingWidgetState extends State<RecordingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true); // Continuous pulsing

    // Define the scale animation
    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.stop();
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when done
    super.dispose();
  }

  RecordController recordController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: double.infinity,
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: Colors.white, // Replace context.whiteColor with Colors.white
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            context.g4,
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                width: 70,
                height: 5,
                decoration: BoxDecoration(
                  color: context.secondaryTextColor.withAlpha(150),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 36),
            recordController.isRecording.value ? context.g4 : context.g20,

            // Replace context.g36
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: child,
                );
              },
              child: GestureDetector(
                onTap: () {
                  if (recordController.isRecording.value) {
                    _controller.stop();

                    recordController.stopRecording();
                  } else {
                    recordController.startRecording();
                    _controller.repeat(reverse: true);
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: context.secondaryTextColor.withAlpha(50),
                    ),
                  ),
                  child: FaIcon(
                    recordController.isRecording.value
                        ? Icons.graphic_eq
                        : Icons.mic_none_outlined,
                    size: recordController.isRecording.value ? 70 : 50,
                    color: recordController.isRecording.value
                        ? Colors.red
                        : context
                            .secondaryTextColor, // Replace context.blackColor with Colors.black
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Replace context.g20
            Text(
              recordController.isRecording.value
                  ? 'يتم التسجيل ...'
                  : recordController.recordingPath.isNotEmpty
                      ? 'التسجيل جاهز للتشغيل'
                      : 'انقر للتسجيل',
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            // SizedBox(height: 20),
            // Replace context.g4
            // Align(
            //   child: GestureDetector(
            //     onTap: () {

            //     },
            //     child: Container(
            //       width: context.width / 3,
            //       padding: EdgeInsets.all(10),
            //       decoration: BoxDecoration(
            //         color: context.secondary,
            //         borderRadius: BorderRadius.circular(22),
            //       ),
            //       child: Align(
            //         alignment: Alignment.center,
            //         child: Text(
            //           recordController.isRecording.value
            //               ? 'ايقاف'
            //               : 'بدأ التسجيل',
            //           style: context.titleMedium.copyWith(
            //             color: context.whiteColor,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width / 3,
            //   child: CustomOutLineBtnWidget(
            //     label: recordController.isRecording.value ? 'ايقاف' : 'تسجيل',
            //     action: () {
            //       if (recordController.isRecording.value) {
            //         _controller.stop();

            //         recordController.stopRecording();
            //       } else {
            //         _controller.repeat(reverse: true);
            //         recordController.startRecording();
            //       }
            //     },
            //   ),
            // ),
            context.g16,
            if (recordController.recordingPath.isNotEmpty &&
                recordController.isRecording.value == false)
              Column(
                children: [
                  Row(
                    spacing: 12,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIconOutLineBtn(
                          icon: Icons.delete_outline,
                          onPress: () {
                            recordController.recordAudioFilePath.value = '';
                            recordController.recordingPath.value = '';
                          }),
                      CustomIconOutLineBtn(
                        icon: recordController.isPlaying.value
                            ? Icons.pause
                            : Icons.play_arrow,
                        onPress: () {
                          if (recordController.isPlaying.value) {
                            recordController.pauseAudio();
                          } else {
                            recordController.playRecordedAudio();
                          }
                        },
                      ),
                      CustomIconOutLineBtn(
                        icon: Icons.stop_outlined,
                        onPress: () => recordController.stopAudio(),
                      ),
                    ],
                  ),
                  context.g12,
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        'المتابعة',
                        style: context.titleMedium,
                      ))
                ],
              )
            else
              SizedBox(
                height: 40,
              ),

            SizedBox(height: 20), // Replace context.g44
          ],
        ),
      ),
    );
  }
}

class CustomIconOutLineBtn extends StatelessWidget {
  CustomIconOutLineBtn({
    super.key,
    required this.icon,
    required this.onPress,
  });

  final RecordController recordController = Get.find();
  final IconData icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      style: ButtonStyle(
        side: WidgetStateProperty.resolveWith<BorderSide>((states) {
          if (states.contains(WidgetState.pressed)) {
            return BorderSide(
              color: Colors.black,
              width: 1,
            ); // Border color when pressed
          }
          return BorderSide(
            color: context.secondaryTextColor.withAlpha(50),
            width: 1,
          ); // Default border color
        }),
      ),
      color: Theme.of(context).colorScheme.secondary,
      onPressed: () {
        onPress();
      },
      icon: Icon(
        icon,
        size: 22,
      ),
    );
  }
}
