import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/extensions/elvated_btn_extension.dart';
import 'package:newart/src/core/extensions/padding_extension.dart';
import 'package:newart/src/core/helpers/validation.dart';
import 'package:newart/src/core/types/status_types.dart';
import 'package:newart/src/core/utils/pick_image_helper.dart';
import 'package:newart/src/core/widgets/custom_text_filed_widget.dart';
import 'package:newart/src/core/widgets/error_state_widget.dart';
import 'package:newart/src/core/widgets/header_widget.dart';
import 'package:newart/src/core/widgets/loading_widget.dart';
import 'package:newart/src/features/order/data/models/payment_order_model.dart';
import 'package:newart/src/features/order/presentation/getX/order_controller.dart';


class OrderPaymentPage extends StatefulWidget {
  const OrderPaymentPage({super.key, required this.id});
  final int id;

  @override
  State<OrderPaymentPage> createState() => _OrderPaymentPageState();
}

class _OrderPaymentPageState extends State<OrderPaymentPage> {
  final OrderController orderController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    orderController.getPaymentDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    // Fallback list in case orderTypes is null

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: context.containerColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                HeaderWidget(title: 'الدفع'),
                context.g20,
                Obx(() {
                  switch (orderController.getPaymentStatus.value) {
                    case Status.success:
                      return _builPaymentForm(context);
                    case Status.error:
                      return ErrorStateWidget(
                        onRetry: () =>
                            orderController.getPaymentDetails(widget.id),
                      ).pt(100);

                    default:
                      return LoadingWidget().pt(150);
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _builPaymentForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: orderController.paymentFormKey,
        child: Column(
          children: [
            Row(
              spacing: 12,
              children: [
                Expanded(
                  flex: 1,
                  child: CustomDropdownWidget<Currency>(
                    items:
                        orderController.orderPaymentDetails.value!.currencies,
                    value: orderController.selectedCurency.value,
                    hint: 'العملة',
                    onChanged: (Currency? value) {
                      if (value != null) {
                        orderController.selectedCurency.value = value;
                      }
                    },
                    itemBuilder: (Currency orderType) {
                      return Text(
                        orderType.name,
                        style: context.bodyLarge,
                      );
                    },
                    icon: Icons.attach_money,
                    dropdownColor: context.whiteColor,
                    iconColor: context.secondaryTextColor,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: context.whiteColor,
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: CustomDropdownWidget<BankAccount>(
                    items:
                        orderController.orderPaymentDetails.value!.bankAccounts,
                    value: orderController.selectedBank.value,
                    hint: orderController.selectedBank.value?.name ?? "البنك",
                    onChanged: (BankAccount? value) {
                      if (value != null) {
                        orderController.selectedBank.value = value;
                      }
                    },
                    itemBuilder: (BankAccount bank) {
                      return Text(
                        bank.name,
                        style: context.bodyLarge,
                      );
                    },
                    icon: Icons.account_balance_outlined,
                    dropdownColor: context.whiteColor,
                    iconColor: context.secondaryTextColor,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: context.whiteColor,
                    ),
                  ),
                ),
                // spacing between the dropdowns
              ],
            ),
            context.g12,
            Row(
              spacing: 12,
              children: [
                Expanded(
                  child: CustomTextFieldWidget(
                    label: 'المبلغ',
                    controller: orderController.priceController,
                    textInputType: TextInputType.number,
                    validator: (p) {
                      validateNotEmpty(p);
                      validateNum(p);
                      return null;
                    },
                    // hint: 'رقم الهاتف',
                  ),
                ),
                Expanded(
                  child: CustomTextFieldWidget(
                    label: 'رقم الحوالة',
                    controller: orderController.paymentNumberController,
                    validator: (p) => validateNotEmpty(p),

                    // hint: 'رقم الهاتف',
                  ),
                ),
              ],
            ),
            context.g8,
            CustomTextFieldWidget(
              label: 'اسم المرسل',
              controller: orderController.nameController,
              validator: (p) => validateNotEmpty(p),

              // hint: 'رقم الهاتف',
            ),
            context.g12,
            CustomTextFieldWidget(
              label: 'رقم المرسل',
              controller: orderController.sendrPhoneController,
              hint: 'رقم الهاتف',
              validator: (p) => validatePhone(p),
              textInputType: TextInputType.number,
            ),
            context.g12,
            CustomTextFieldWidget(
              label: 'اسم المستلم',
              controller: orderController.reciverNameController,
              validator: (p) => validateNotEmpty(p),

              // hint: 'رقم الهاتف',
            ),
            context.g12,
            CustomTextFieldWidget(
              label: 'رقم المستلم',
              controller: orderController.reciverPhoneController,
              validator: (p) => validatePhone(p),
              textInputType: TextInputType.number,

              // hint: 'رقم الهاتف',
            ),
            context.g20,
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'صورة الدفع',
                style: context.bodyMedium,
              ),
            ),
            context.g8,
            GestureDetector(
              onTap: () async {
                final image = await pickImage();
                if (image != null) {
                  orderController.paymentImage.value = File(image.path);
                }
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: context.whiteColor,
                  borderRadius: BorderRadius.circular(15),
                  image: orderController.paymentImage.value.path != ''
                      ? DecorationImage(
                          image: FileImage(
                            orderController.paymentImage.value,
                          ),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: Center(
                  child: Container(
                    // height: 50,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: context.containerColor,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        context.g12,
                        Text(
                          'صورة الدفع',
                          style: context.bodyMedium,
                        ),
                        const SizedBox(width: 12),
                        Icon(
                          Icons.add,
                          color: context.secondaryTextColor,
                          size: 22,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            context.g12,
            CustomTextFieldWidget(
              label: 'البيان',
              controller: orderController.noteController,
              validator: (p) => validateNotEmpty(p),
            ),
            context.g16,

            ElevatedButtonExtension.primary(
                label: "حفظ",
                onPressed: () {
                  orderController.createNewPayment(
                    widget.id,
                  );
                }),
            context.g28,
            // CustomBtnWithIconWidget(
            //   title: "حفظ",
            //   action: () {

            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

class CustomDropdownWidget<T> extends StatelessWidget {
  final List<T> items;
  final T? value;
  final String hint;
  final ValueChanged<T?> onChanged;
  final Widget Function(T) itemBuilder;
  final IconData icon;
  final Color? dropdownColor;
  final Color? iconColor;
  final double height;
  final EdgeInsetsGeometry padding;
  final BoxDecoration? decoration;

  const CustomDropdownWidget({
    super.key,
    required this.items,
    required this.value,
    required this.hint,
    required this.onChanged,
    required this.itemBuilder,
    this.icon = Icons.category,
    this.dropdownColor,
    this.iconColor,
    this.height = 50,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.center,
      padding: padding,
      decoration: decoration ??
          BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).cardColor,
          ),
      child: DropdownButton<T>(
        isExpanded: true,
        dropdownColor: dropdownColor ?? Theme.of(context).cardColor,
        elevation: 0,
        borderRadius: BorderRadius.circular(10),
        items: items.map((T item) {
          return DropdownMenuItem<T>(
            alignment: AlignmentDirectional.center,
            value: item,
            child: itemBuilder(item),
          );
        }).toList(),
        onChanged: onChanged,
        hint: Text(
          hint,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        value: value,
        underline: const SizedBox(),
        icon: Icon(
          icon,
          size: 20,
          color: iconColor ?? Theme.of(context).iconTheme.color,
        ),
        alignment: AlignmentDirectional.center,
      ),
    );
  }
}
