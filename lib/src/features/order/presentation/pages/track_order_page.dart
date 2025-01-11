import 'package:flutter/material.dart';
import 'package:new_art/src/core/extensions/context_extensions.dart';
import 'package:new_art/src/core/extensions/padding_extension.dart';
import 'package:new_art/src/core/widgets/header_widget.dart';
import 'package:new_art/src/features/order/presentation/pages/all_orders_page.dart';
import 'package:new_art/src/features/order/presentation/widgets/order_type_widget.dart';

class TrackOrderPage extends StatelessWidget {
  final List<Order> orders = [
    Order(
      orderName: "Order #1234",
      statuses: [
        OrderStatus(
          name: "Order Placed",
          date: "2025-01-01",
          isCompleted: true,
          color: Colors.blue,
          icon: Icons.shopping_cart,
        ),
        OrderStatus(
          name: "Processing",
          date: "2025-01-02",
          isCompleted: true,
          color: Colors.orange,
          icon: Icons.sync,
        ),
        OrderStatus(
          name: "Shipped",
          date: "2025-01-03",
          isCompleted: true,
          color: Colors.green,
          icon: Icons.local_shipping,
        ),
        OrderStatus(
          name: "Out for Delivery",
          date: "2025-01-04",
          isCompleted: true,
          color: Colors.purple,
          icon: Icons.delivery_dining,
        ),
        OrderStatus(
          name: "Delivered",
          date: "2025-01-05",
          isCompleted: true,
          color: Colors.teal,
          icon: Icons.home,
        ),
      ],
    ),
    Order(
      orderName: "Order #5678",
      statuses: [
        OrderStatus(
          name: "Order Placed",
          date: "2025-01-01",
          isCompleted: true,
          color: Colors.blue,
          icon: Icons.shopping_cart,
        ),
        OrderStatus(
          name: "Completed",
          date: "2025-01-02",
          isCompleted: true,
          color: Colors.green,
          icon: Icons.home,
        ),
      ],
    ),
  ];

  TrackOrderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(title: 'تتبع الطلب'),
              context.g16,
              ListView.builder(
                primary: true,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return OrderTimelineCard(order: orders[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderTimelineCard extends StatelessWidget {
  final Order order;

  const OrderTimelineCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: context.secondaryTextColor.withAlpha(50))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: order.statuses.map((status) {
              int index = order.statuses.indexOf(status);

              return TimelineTile(
                label: status.name,
                date: status.date,
                isCompleted: status.isCompleted,
                color: status.color,
                icon: status.icon,
                isLeft: index % 2 != 0,
              );
            }).toList(),
          ),
          context.g12,
          Align(
            alignment: Alignment.center,
            child: IntrinsicWidth(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: context.secondary,
                ),
                child: Center(
                  child: Text(
                    'تعديل الطلب',
                    style: context.bodyLarge.copyWith(
                      color: context.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
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
                      '11',
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
                      'اسم الزفة',
                      style: context.titleMedium,
                    )
                  ],
                ),
                context.g4,
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '2022/2/2',
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
                            type: 1,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                // context.g4,
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TimelineTile extends StatelessWidget {
  final String label;
  final String date;
  final bool isCompleted;
  final Color color;
  final IconData icon;
  final bool isLeft;

  const TimelineTile({
    super.key,
    required this.label,
    required this.date,
    required this.isCompleted,
    required this.color,
    required this.icon,
    required this.isLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SizedBox(
        //   width: context.width / 2,
        // ),
        if (isLeft) Expanded(child: Container()),

        if (!isLeft)
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  label,
                  style: context.bodyLarge.copyWith(
                    color: context.blackColor,
                  ),
                ),
                Text(
                  date,
                  style: context.bodySmall,
                ),
              ],
            ),
          ),
        SizedBox(width: 16),
        Column(
          children: [
            Container(
              width: 1,
              height: 37,
              color: isCompleted ? color : Colors.grey[400],
            ),
            CircleAvatar(
              backgroundColor: isCompleted ? color : Colors.grey[300],
              radius: 15,
              child: Icon(
                icon,
                color: isCompleted ? Colors.white : Colors.grey,
                size: 18,
              ),
            ),
          ],
        ),
        SizedBox(width: 16),
        if (!isLeft) Expanded(child: Container()),

        if (isLeft)
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 35,
                ),
                Text(
                  label,
                  style: context.bodyLarge.copyWith(
                    color: context.blackColor,
                  ),
                ),
                Text(
                  date,
                  style: context.bodySmall,
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class Order {
  final String orderName;
  final List<OrderStatus> statuses;

  Order({required this.orderName, required this.statuses});
}

class OrderStatus {
  final String name;
  final String date;
  final bool isCompleted;
  final Color color;
  final IconData icon;

  OrderStatus({
    required this.name,
    required this.date,
    required this.isCompleted,
    required this.color,
    required this.icon,
  });
}
