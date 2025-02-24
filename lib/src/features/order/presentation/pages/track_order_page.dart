import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/types/status_types.dart';
import 'package:newart/src/core/widgets/beautiful_simple_loading.dart';
import 'package:newart/src/core/widgets/error_state_widget.dart';
import 'package:newart/src/core/widgets/header_widget.dart';
import 'package:newart/src/features/order/presentation/getX/order_controller.dart';
import 'package:newart/src/features/order/presentation/widgets/complete_order_item_widget.dart';
import 'package:newart/src/features/order/presentation/widgets/order_initial_widget.dart';
import 'package:newart/src/features/order/presentation/widgets/order_timeline_card.dart';

import '../../../../core/routes/app_pages.dart';
import '../widgets/category_widget.dart';

class TrackOrderPage extends StatelessWidget {
  OrderController orderController = Get.find();
  final allLabel = 'الحالية';
  TrackOrderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => orderController.fetchAllOrders(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeaderWidget(title: 'الطلبات'),
                context.g4,
                Obx(() {
                  switch (orderController.orderStatus.value) {
                    case Status.initial:
                      return OrderInitialWidget();

                    case Status.error:
                      return ErrorStateWidget(
                          onRetry: orderController.fetchAllOrders);
                    case Status.success:
                      return Column(
                        children: [
                          ReusableCategoriesWithSearchWidget(
                            allLabel: allLabel,
                            groups: ['السابقة', 'المكتملة'],
                            onSearchChanged: (query) {},
                            selected: orderController.selectedCategory.value,
                            onCategoryTapped: (category) {
                              orderController.filterOrdersFunc(category);
                              orderController.selectedCategory.value = category;
                            },
                            onReset: () {
                              // Handle reset action
                            },
                          ),
                          context.g12,
                          allLabel == orderController.selectedCategory.value
                              ? ListView.builder(
                                  key: Key(allLabel),
                                  primary: true,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      orderController.unCompletedOrder.length,
                                  itemBuilder: (context, index) {
                                    return OrderTimelineCard(
                                      order: orderController
                                          .unCompletedOrder[index],
                                    );
                                  },
                                )
                              : ListView.separated(
                                  key: Key(
                                      orderController.selectedCategory.value),
                                  primary: true,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      orderController.filteredOrders.length,
                                  itemBuilder: (context, index) {
                                    return CompleteOrderItemWidget(
                                      orderModel:
                                          orderController.filteredOrders[index],
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      context.g8,
                                ),
                          context.g28,
                        ],
                      );
                    default:
                      return BeautifulSimpleLoading();
                  }
                })
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        isExtended: false,
        onPressed: () {
          Get.toNamed(Routes.ADD_ORDER);
        },
        backgroundColor: context.primary,
        elevation: 0,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(20),
        // ),
        child: Icon(
            Icons.add_shopping_cart_outlined), // Background color of the FAB
      ),
    );
  }
}
