import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/types/status_types.dart';
import 'package:newart/src/core/widgets/beautiful_simple_loading.dart';
import 'package:newart/src/core/widgets/error_state_widget.dart';
import 'package:newart/src/core/widgets/header_widget.dart';
import 'package:newart/src/features/order/presentation/widgets/order_initial_widget.dart';
import 'package:newart/src/features/wallet/presentation/getX/wallet_controller.dart';
import 'package:newart/src/features/wallet/presentation/pages/wallet_page.dart';

class AllPaymentPage extends StatelessWidget {
  AllPaymentPage({super.key});
  WalletController walletController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(title: 'المدفوعات'),
            Obx(() {
              switch (walletController.allPaymentStatus.value) {
                case Status.error:
                  return ErrorStateWidget(
                      onRetry: walletController.fetchAllPayments);
                case Status.loading:
                  return BeautifulSimpleLoading();
                case Status.success:
                  return ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        walletController.allPayments.value?.payment.length ?? 0,
                    separatorBuilder: (BuildContext context, int index) {
                      return context.g8;
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return DetailsOperationItemWidget(
                        currencySymbole: 'RY',
                        date: DateTime.now(),
                        type: 1,
                        price: 1000,
                        number: 1,
                      );
                    },
                  );

                default:
                  return OrderInitialWidget();
              }
            })
          ],
        ),
      )),
    );
  }
}
