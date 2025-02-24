import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newart/src/features/order/data/models/order_model.dart';
import 'package:newart/src/features/order/presentation/getX/order_controller.dart';

class SearchDropdownWidget extends StatelessWidget {
  SearchDropdownWidget({
    super.key,
  });

  // BillController billController = Get.find();
  final OrderController orderController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 55,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomDropdown<OrderModel>.search(
            hintText: 'جلب البيانات من طلب سابق',
            searchHintText: 'بحث ...',
            // noResultFoundText: 'لا توجد نتائج',
            noResultFoundBuilder: (context, str) => SizedBox(),

            items: orderController.allOrders.value?.orders ?? [],
            excludeSelected: false,
            // overlayHeight: 100,
            decoration: CustomDropdownDecoration(
              closedBorderRadius: BorderRadius.circular(12),
              expandedBorderRadius: BorderRadius.circular(12),
            ),
            onChanged: (value) {
              if (value != null) {
                orderController.fillFromOldOrder(value);
              }
            },
          ),
        ),
      ),
    );
  }
}
