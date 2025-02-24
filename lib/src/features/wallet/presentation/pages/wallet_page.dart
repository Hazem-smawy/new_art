// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as date_format;

import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/extensions/padding_extension.dart';
import 'package:newart/src/core/widgets/header_widget.dart';
import 'package:newart/src/core/widgets/thin_divider_widget.dart';

import '../../../../core/utils/currency_format.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            HeaderWidget(title: 'محفظتي'),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
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
                        height: 170,
                        margin: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: context.secondaryTextColor.withAlpha(50)),
                          borderRadius: BorderRadius.circular(10),
                          color: context.secondary,
                        ),
                      ),
                      Positioned(
                        right: -30,
                        top: -10,
                        child: FaIcon(
                          FontAwesomeIcons.star,
                          color: context.secondaryTextColor,
                          size: 150,
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: 10,
                        child: FaIcon(
                          FontAwesomeIcons.star,
                          color: context.secondaryTextColor,
                          size: 50,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          top: 30,
                          bottom: 16,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'رقم الحساب',
                              textAlign: TextAlign.right,
                              style: context.bodyLarge.copyWith(
                                color: context.whiteColor.withAlpha(200),
                              ),
                            ),
                            context.g4,
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              width: context.width / 2,
                              decoration: BoxDecoration(
                                color: context.containerColor.withAlpha(20),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '111 222 293',
                                    style: context.titleLarge.copyWith(
                                      color: context.whiteColor,
                                    ),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.copy,
                                    color: context.whiteColor,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                            context.g12,
                            Text(
                              'الرصيد المتاح',
                              textAlign: TextAlign.right,
                              style: context.bodyLarge.copyWith(
                                  color: context.whiteColor.withAlpha(200)),
                            ),
                            context.g4,
                            SizedBox(
                              width: context.width / 2.1,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'RS 10000',
                                    style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: context.whiteColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: context.whiteColor,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: context.width / 2,
                              child: ThinDividerWidget(),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            // context.g12,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WalletItemWidget(
                        color: Colors.green,
                        title: 'اضافة رصيد',
                        icon: FontAwesomeIcons.arrowDown,
                      ),
                      WalletItemWidget(
                        color: Colors.red,
                        title: 'تحويل رصيد',
                        icon: FontAwesomeIcons.arrowsTurnToDots,
                      ),
                      WalletItemWidget(
                        color: Colors.purple,
                        title: 'سداد طلبات',
                        icon: FontAwesomeIcons.arrowTrendUp,
                      ),
                      WalletItemWidget(
                        color: Colors.blue,
                        title: 'سداد متأخرات',
                        icon: FontAwesomeIcons.arrowsDownToLine,
                      ),
                    ],
                  ),
                  context.g12,
                  // WalletItemWidget(
                  //   color: Colors.teal,
                  //   title: 'سداد طلبات',
                  //   icon: FontAwesomeIcons.arrowTrendUp,
                  // ),
                ],
              ),
            ),
            context.g20,
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'العمليات الحديثة',
                style: context.titleLarge,
              ),
            ).pr(16),
            context.g12,
            Column(
              children: [
                DetailsOperationItemWidget(
                  currencySymbole: 'RY',
                  date: DateTime.now(),
                  type: 1,
                  price: 1000,
                  number: 1,
                ),
                // ThinDividerWidget(),
                context.g8,
                DetailsOperationItemWidget(
                  currencySymbole: 'RY',
                  date: DateTime.now(),
                  type: 1,
                  price: 1000,
                  number: 1,
                ),
              ],
            ).ph(16)
          ],
        ),
      ),
    );
  }
}

class WalletItemWidget extends StatelessWidget {
  final Color color;
  final String title;
  final IconData icon;
  const WalletItemWidget({
    super.key,
    required this.color,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        // color: Colors.green.withAlpha(30),
      ),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withAlpha(200),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 22,
              ),
            ),
            context.g12,
            SizedBox(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.fade,
                  style: context.bodyMedium.copyWith(
                    color: context.blackColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailsOperationItemWidget extends StatelessWidget {
  final DateTime date;
  final int type;
  final double price;
  final int number;
  final String currencySymbole;

  const DetailsOperationItemWidget({
    super.key,
    required this.date,
    required this.type,
    required this.price,
    required this.currencySymbole,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        // color: context.containerColor,
        border: Border.all(
          color: context.secondaryTextColor.withAlpha(50),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    price > 0 ? Icons.arrow_downward : Icons.arrow_upward,
                    color: price > 0 ? Colors.red : Colors.green,
                    size: 18,
                  ),
                  context.g8,
                  Text(
                    currencySymbole,
                    style: context.titleLarge.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  context.g4,
                  Text(
                    currencyFormat(number: price.abs().toStringAsFixed(2)),
                    style: context.titleLarge.copyWith(
                      color: context.blackColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              context.g4,
              Text(
                date_format.DateFormat.yMd().format(date),
                style: context.bodySmall,
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      number.toString(),
                      style: context.titleLarge,
                    ),
                    context.g4,
                    Text(
                      "رقم  العملية",
                      style: context.bodySmall,
                    ),
                  ],
                ),
                context.g4,
                OperationTypeWidget(type: type)
              ],
            ),
          ),
          context.g12,
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.purple.withAlpha(20),
            child: Icon(
              Icons.trending_down,
              color: Colors.purple,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}

class OperationTypeWidget extends StatelessWidget {
  const OperationTypeWidget({
    super.key,
    required this.type,
  });

  final int type;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.red.withAlpha(20),
        ),
        child: Text(
          'مدفوعات',
          style: context.bodySmall.copyWith(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
