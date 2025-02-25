import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/extensions/padding_extension.dart';
import 'package:newart/src/core/routes/app_pages.dart';
import 'package:newart/src/core/utils/data_format.dart';
import 'package:newart/src/core/widgets/custom_btns_widget.dart';
import 'package:newart/src/core/widgets/thin_divider_widget.dart';
import 'package:newart/src/features/order/data/models/order_model.dart';
import 'package:newart/src/features/order/domain/entities/entities.dart';
import 'package:newart/src/features/order/presentation/widgets/order_audio_file_widget.dart';
import 'package:newart/src/features/order/presentation/widgets/order_type_widget.dart';

class OrderDetailsSheet extends StatelessWidget {
  const OrderDetailsSheet({
    super.key,
    required this.orderModel,
  });

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: context.whiteColor,
        ),
        child: Column(
          children: [
            context.g16,
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                    Get.toNamed(Routes.ADD_MOD_ORDER, arguments: orderModel);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.secondaryTextColor.withAlpha(50),
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        context.g16,
                        Text(
                          'طلب تعديل',
                          style: context.bodySmall,
                        ),
                        SizedBox(
                          width: 35,
                          height: 35,
                          child: Icon(
                            Icons.refresh,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                OrderTypeWidget(
                  status: OrderStatus.getStatus(orderModel.orderStatus).name,
                  color: OrderStatus.getStatus(orderModel.orderStatus).color,
                ),
                context.g12,
                OrderTypeWidget(
                  status: PaymentStatus.getStatus(orderModel.orderPayment).name,
                  color: PaymentStatus.getStatus(orderModel.orderPayment).color,
                ),
              ],
            ),
            // ThinDividerWidget(),
            context.g16,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  orderModel.ordId,
                  style: context.titleLarge.copyWith(
                    color: context.blackColor,
                  ),
                ),
                context.g4,
                Text(
                  ':رقم الطلب',
                  style: context.bodySmall,
                ),
                Spacer(),
                Text(
                  orderModel.nameOrder,
                  style: context.displayMedium,
                )
              ],
            ),
            context.g4,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  timeString2String(orderModel.dateOrder),
                  style: context.bodyMedium,
                ),
                const SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 17,
                  color: context.secondaryTextColor,
                ),
                Spacer(),
                Text(
                  'تأريخ الطلب',
                  style: context.bodyMedium,
                )
              ],
            ),
            context.g4,
            ThinDividerWidget(),
            context.g4,
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'معلومات الطلب',
                style: context.titleLarge,
              ),
            ),
            context.g8,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  orderModel.artistName,
                  style: context.bodyLarge.copyWith(
                    color: context.blackColor,
                  ),
                ),
                context.g12,
                Text(
                  'اسم الفنان',
                  style: context.bodyMedium,
                ),
              ],
            ),
            context.g8,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    orderModel.workingLink,
                    textAlign: TextAlign.right,
                    style: context.bodyLarge.copyWith(
                      color: context.blackColor,
                    ),
                  ),
                ),
                context.g12,
                Text(
                  'رابط الطلب',
                  style: context.bodyMedium,
                ),
              ],
            ),
            context.g8,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    orderModel.comments,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: context.bodyLarge.copyWith(
                      color: context.blackColor,
                    ),
                  ),
                ),
                context.g12,
                Text(
                  'ملاحظة',
                  textDirection: TextDirection.rtl,
                  style: context.bodyMedium,
                ),
              ],
            ),
            OrderAudioFileWidget(
              orderModel: orderModel,
            ),
            context.g12,
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'القصيدة',
                style: context.bodyMedium,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    orderModel.orderData,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: context.bodySmall,
                  ),
                )
              ],
            )
          ],
        ).ph(16),
      ),
    );
  }
}
