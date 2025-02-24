import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/routes/app_pages.dart';
import 'package:newart/src/core/utils/data_format.dart';
import 'package:newart/src/features/order/data/models/order_model.dart';
import 'package:newart/src/features/order/domain/entities/entities.dart';
import 'package:newart/src/features/order/presentation/getX/order_controller.dart';
import 'package:newart/src/features/order/presentation/pages/order_details_sheet.dart';
import 'package:newart/src/features/order/presentation/pages/order_payment_page.dart';
import 'package:newart/src/features/order/presentation/widgets/order_type_widget.dart';
import 'package:newart/src/features/order/presentation/widgets/timeline_tile.dart';


class OrderTimelineCard extends StatelessWidget {
  final OrderModel order;

  OrderTimelineCard({super.key, required this.order});
  OrderController orderController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(OrderDetailsSheet(orderModel: order));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border:
                Border.all(color: context.secondaryTextColor.withAlpha(50))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: order.getOrderStatus.map((status) {
                return TimelineTile(
                  selected: order.orderStatus == status.statusId,
                  label: status.name,
                  date: status.date == '0000-00-00'
                      ? status.date
                      : timeString2String(status.date),
                  isCompleted: status.isCompleted,
                  color: status.color,
                  icon: status.icon,
                  isLeft: status.id % 2 != 0,
                );
              }).toList(),
            ),
            context.g12,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                if (order.orderStatus <= 3)
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.ADD_ORDER, arguments: order);
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: IntrinsicWidth(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: context.secondaryTextColor.withAlpha(50),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'تعديل الطلب',
                              style: context.bodyLarge.copyWith(
                                color: context.secondary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (order.orderStatus == 1 &&
                    (order.orderPayment == 0 || order.orderPayment == 2))
                  GestureDetector(
                    onTap: () {
                      Get.to(() => OrderPaymentPage(id: order.id));
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: IntrinsicWidth(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: context.primary,
                          ),
                          child: Center(
                            child: Text(
                              "ادفع الان",
                              style: context.bodyLarge.copyWith(
                                color: context.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            // context.g12,
            Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: context.backgroundColor.withAlpha(150),
                // border: Border.all(
                //   color: context.secondaryTextColor.withAlpha(50),
                // ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        order.id.toString(),
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
                        order.nameOrder,
                        style: context.titleMedium,
                      )
                    ],
                  ),
                  context.g4,
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        timeString2String(order.dateOrder),
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
                      OrderTypeWidget(
                        key: Key(order.id.toString()),
                        status:
                            PaymentStatus.getStatus(order.orderPayment).name,
                        color:
                            PaymentStatus.getStatus(order.orderPayment).color,
                      ),
                      context.g8,
                      OrderTypeWidget(
                        status: OrderStatus.getStatus(order.orderStatus).name,
                        color: OrderStatus.getStatus(order.orderStatus).color,
                      ),
                    ],
                  ),
                  // context.g4,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
