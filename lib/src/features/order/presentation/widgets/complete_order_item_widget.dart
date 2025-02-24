import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/utils/data_format.dart';
import 'package:newart/src/features/order/data/models/order_model.dart';
import 'package:newart/src/features/order/domain/entities/entities.dart';
import 'package:newart/src/features/order/presentation/pages/order_details_sheet.dart';
import 'package:newart/src/features/order/presentation/widgets/order_type_widget.dart';

class CompleteOrderItemWidget extends StatelessWidget {
  final OrderModel orderModel;
  const CompleteOrderItemWidget({
    super.key,
    required this.orderModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(OrderDetailsSheet(orderModel: orderModel));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: context.secondaryTextColor.withAlpha(50),
          ),
        ),
        child: Column(
          children: [
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
              // crossAxisAlignment: CrossAxisAlignment.end,
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
                const Spacer(),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      context.g8,
                      OrderTypeWidget(
                        status:
                            OrderStatus.getStatus(orderModel.orderStatus).name,
                        color:
                            OrderStatus.getStatus(orderModel.orderStatus).color,
                      ),
                    ],
                  ),
                )
              ],
            ),
            // context.g4,
          ],
        ),
      ),
    );
  }
}
