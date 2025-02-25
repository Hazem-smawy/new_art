import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/constants/colors.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/extensions/padding_extension.dart';
import 'package:newart/src/core/helpers/validation.dart';
import 'package:newart/src/core/types/status_types.dart';
import 'package:newart/src/core/widgets/beautiful_simple_loading.dart';
import 'package:newart/src/core/widgets/custom_text_filed_widget.dart';
import 'package:newart/src/core/widgets/header_widget.dart';
import 'package:newart/src/core/widgets/local_notification_widget.dart';
import 'package:newart/src/features/audio_player/presentation/getX/audio_player_controller.dart';
import 'package:newart/src/features/home/presentation/getX/home_controller.dart';
import 'package:newart/src/features/order/data/models/order_model.dart';
import 'package:newart/src/features/order/data/models/order_types_model.dart';
import 'package:newart/src/features/order/presentation/getX/file_picker_controller.dart';
import 'package:newart/src/features/order/presentation/getX/order_controller.dart';
import 'package:newart/src/features/order/presentation/getX/record_controller.dart';
import 'package:newart/src/features/order/presentation/widgets/order_audio_file_widget.dart';
import 'package:newart/src/features/order/presentation/widgets/recording_widget.dart';
import 'package:newart/src/features/order/presentation/widgets/search_dropdown_widget.dart';

import '../../../../core/constants/spaces_sizes.dart';

class AddModOrderPage extends StatefulWidget {
  const AddModOrderPage({super.key});

  @override
  State<AddModOrderPage> createState() => _AddModOrderPageState();
}

class _AddModOrderPageState extends State<AddModOrderPage> {
  final FilePickerController filePickerController = Get.find();
  final RecordController recordController = Get.find();

  final OrderController orderController = Get.find();
  AudioController audioController = Get.find();
  HomeController homeController = Get.find();
  OrderModel? order;

  @override
  void initState() {
    super.initState();

    if (Get.arguments != null) {
      order = Get.arguments as OrderModel;
      orderController.resetControllers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(title: 'طلب تعديل'),
              context.g16,
              _addOrderForm(context),
            ],
          ),
        ),
      ),
    );
  }

  Form _addOrderForm(BuildContext context) {
    return Form(
      key: orderController.orderFormKey,
      child: Column(
        children: [
          SizedBox(
            height: context.height / 3 - 100,
          ),
          CustomTextFieldWidget(
            controller: orderController.noteController,
            label: 'الوصف',
            minLine: 3,
            maxLine: 3,
            validator: (p0) => validateNotEmpty(p0),
          ),
          context.g12,

          // context.g12,

          Obx(
            () => Row(
              children: [
                GestureDetector(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();

                    Get.bottomSheet(RecordingWidget());
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: context.secondaryTextColor.withAlpha(
                          50,
                        ),
                      ),
                    ),
                    child: Icon(
                      Icons.mic_outlined,
                      color: recordController.recordAudioFilePath.value == ""
                          ? context.secondaryTextColor
                          : Colors.green,
                    ),
                  ),
                ),
                context.g8,
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();

                      filePickerController.pickFiles();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: context.secondaryTextColor.withAlpha(
                            50,
                          ),
                        ),
                      ),
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(),
                          if (filePickerController.selectedFiles.isNotEmpty)
                            Row(
                              children: [
                                Text(
                                  'ملف',
                                  style: context.bodySmall,
                                ),
                                context.g4,
                                Text(
                                  '${filePickerController.selectedFiles.length}',
                                  style: context.titleLarge
                                      .copyWith(color: Colors.green),
                                ),
                                context.g4,
                                Text(
                                  'تم اختيار ',
                                  style: context.bodySmall,
                                )
                              ],
                            ),
                          if (filePickerController.selectedFiles.isEmpty)
                            Text(
                              'المرفقات الصوتية',
                              style: context.bodyLarge,
                            ),
                          context.g12,
                          FaIcon(
                            Icons.upload_outlined,
                            color: context.secondaryTextColor,
                            size: 22,
                          ),
                          Spacer(),
                          if (filePickerController.selectedFiles.isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                filePickerController.selectedFiles.value = [];
                              },
                              child: FaIcon(
                                Icons.delete_outline,
                                color: filePickerController
                                        .selectedFiles.isNotEmpty
                                    ? Colors.red
                                    : context.secondaryTextColor,
                                size: 20,
                              ),
                            ),
                          context.g12,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          context.g16,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              elevation: 0,
              padding: const EdgeInsets.symmetric(
                horizontal: Spaces.sp16,
                vertical: Spaces.sp8,
              ),
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: AppColors.containerColor.withAlpha(125),
                ),
              ),
            ),
            onPressed: () async {
              await orderController.addNewOrderMode(order?.id ?? 0);
              // Get.back();
            },
            child: Text(
              'إرسال',
              style: context.titleLarge.copyWith(
                color: context.whiteColor,
              ),
            ),
          ),
          context.g28,
        ],
      ).ph(16),
    );
  }
}
