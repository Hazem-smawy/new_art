import 'package:flutter/material.dart';
import 'package:new_art/src/core/extensions/context_extensions.dart';
import 'package:new_art/src/features/order/presentation/pages/all_orders_page.dart';
import 'package:new_art/src/features/order/presentation/widgets/order_type_widget.dart';

class CompleteOrderItemWidget extends StatelessWidget {
  const CompleteOrderItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                style: context.displayMedium,
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
    );
  }
}
