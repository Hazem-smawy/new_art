import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/types/status_types.dart';
import 'package:newart/src/core/utils/currency_format.dart';
import 'package:newart/src/core/utils/dialogs.dart';
import 'package:newart/src/core/widgets/beautiful_simple_loading.dart';
import 'package:newart/src/core/widgets/error_state_widget.dart';
import 'package:newart/src/core/widgets/header_widget.dart';
import 'package:newart/src/core/widgets/thin_divider_widget.dart';
import 'package:newart/src/features/banks/data/models/bank_model.dart';
import 'package:newart/src/features/banks/presentation/getX/banks_controller.dart';
import 'package:newart/src/features/exclusive/presentation/widgets/empty_widget.dart';

class OurBankAccountsPage extends StatelessWidget {
  OurBankAccountsPage({super.key});
//OurBankAccountsController
  BanksController banksController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.whiteColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HeaderWidget(title: 'حساباتنا'),
                context.g20,
                Obx(() {
                  switch (banksController.banksStatus.value) {
                    case Status.error:
                      return ErrorStateWidget(
                          onRetry: banksController.fetchAllBanks);
                    case Status.loading:
                      return BeautifulSimpleLoading();
                    case Status.initial:
                      return EmptyWidget(action: () {});
                    case Status.success:
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: banksController.banksData.value!.data.length,
                        padding: const EdgeInsets.only(
                            top: 0, left: 16, right: 16, bottom: 32),
                        itemBuilder: (BuildContext context, int index) {
                          return BankItemWidget(
                            bank: banksController.banksData.value!.data[index],
                          );
                        },
                      );
                  }
                }),
              ],
            ),
          ),
        ));
  }
}

class BankItemWidget extends StatelessWidget {
  final Bank bank;
  const BankItemWidget({
    super.key,
    required this.bank,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              height: 150,
              margin: const EdgeInsets.only(
                bottom: 10,
              ),
              decoration: BoxDecoration(
                border:
                    Border.all(color: context.secondaryTextColor.withAlpha(50)),
                borderRadius: BorderRadius.circular(10),
                // color: context.containerColor,
              ),
            ),
            Positioned(
                right: 16,
                bottom: 20,
                child: Column(
                  children: [
                    Text(
                      bank.name,
                      style: context.bodyLarge.copyWith(
                        color: context.blackColor,
                      ),
                    ),
                    context.g4,
                    Text(
                      bank.nameEn,
                      style: context.bodyLarge,
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                top: 30,
                bottom: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bank.accountName,
                    style: context.titleMedium,
                  ),
                  SizedBox(
                    width: Get.width / 2 - 30,
                    child: ThinDividerWidget(),
                  ),
                  Text(
                    'رقم الحساب',
                    textAlign: TextAlign.right,
                    style: context.bodyMedium,
                  ),
                  context.g4,
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(
                        ClipboardData(text: bank.accountNumber),
                      );
                      CustomDialog.customSnackBar(
                        'تم النسخ بنجاح',
                      );
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      width: Get.width / 2.5,
                      decoration: BoxDecoration(
                          color: context.containerColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            accountNumberFormat(number: bank.accountNumber),
                            textDirection: TextDirection.ltr,
                            style: context.displayMedium,
                          ),
                          FaIcon(
                            FontAwesomeIcons.copy,
                            color: context.blackColor,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
