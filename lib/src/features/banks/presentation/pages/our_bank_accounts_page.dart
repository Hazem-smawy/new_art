import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:new_art/src/core/extensions/context_extensions.dart';
import 'package:new_art/src/core/extensions/padding_extension.dart';
import 'package:new_art/src/core/widgets/header_widget.dart';
import 'package:new_art/src/core/widgets/thin_divider_widget.dart';

class OutBankAccountsPage extends StatelessWidget {
  const OutBankAccountsPage({super.key});
//OurBankAccountsController

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
            // Container(
            //   margin: const EdgeInsets.symmetric(horizontal: 20),
            //   padding: const EdgeInsets.all(16),
            //   width: double.infinity,
            //   decoration: const BoxDecoration(
            //       // borderRadius: BorderRadius.circular(15),
            //       // border: Border.all(
            //       //   color: context.secondaryTextColor.withOpacity(0.2),
            //       // ),
            //       ),
            //   child: Text(
            //     'عميلنا العزيز \n هذه الحسابات المعتمدة لدينا فقط \n نحن غير مسؤولون عن اي مبلغ يتم ايداعها لأي حساب اخر',
            //     textAlign: TextAlign.center,
            //     style: context.bodyLarge,
            //   ),
            // ),
            // context.g4,
            // const ThinDividerWidget(),
            // context.g4,
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              reverse: false,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  // margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(
                    //   color: context.secondaryTextColor.withOpacity(0.2),
                    // ),
                    // color: context.primary,
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
                            border: Border.all(
                                color:
                                    context.secondaryTextColor.withAlpha(50)),
                            borderRadius: BorderRadius.circular(10),
                            // color: context.containerColor,
                          ),
                        ),
                        Positioned(
                            right: 16,
                            bottom: 28,
                            child: Column(
                              children: [
                                Text(
                                  'بنك الكريمي',
                                  style: TextStyle(
                                    color: context.blackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'KORIMY BANK',
                                  style: TextStyle(
                                    color: context.blackColor.withAlpha(180),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                              Text('وجدي محمد محمد',
                                  style: TextStyle(
                                    color: context.blackColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(
                                width: Get.width / 2 - 30,
                                child: ThinDividerWidget(),
                              ),
                              Text(
                                'رقم الحساب',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: context.secondaryTextColor,
                                ),
                              ),
                              context.g4,
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                width: Get.width / 2,
                                decoration: BoxDecoration(
                                    color: context.containerColor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '111 222 293',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: context.blackColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                    FaIcon(
                                      FontAwesomeIcons.copy,
                                      color: context.blackColor,
                                      size: 20,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            Container(),
          ],
        ),
      )),
    );
  }
}
