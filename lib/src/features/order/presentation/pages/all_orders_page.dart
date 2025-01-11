import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:new_art/src/core/extensions/context_extensions.dart';
import 'package:new_art/src/core/extensions/elvated_btn_extension.dart';
import 'package:new_art/src/core/extensions/padding_extension.dart';
import 'package:new_art/src/core/widgets/header_widget.dart';
import 'package:new_art/src/core/widgets/thin_divider_widget.dart';
import 'package:new_art/src/features/new_work/presentation/widgets/categories_with_search_widget.dart';
import 'package:new_art/src/features/order/presentation/pages/track_order_page.dart';
import 'package:new_art/src/features/order/presentation/widgets/complete_order_item_widget.dart';

import '../../../../core/utils/currency_format.dart';
import '../widgets/widgets.dart';

class AllOrdersPage extends StatefulWidget {
  const AllOrdersPage({super.key});

  @override
  State<AllOrdersPage> createState() => _AllOrdersPageState();
}

class _AllOrdersPageState extends State<AllOrdersPage> {
  int activeStep = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      body: SafeArea(
          child: Column(
        children: [
          HeaderWidget(
            title: 'كل الطلبات',
          ),
          context.g8,
          CategoriesWithSearchWidget(),
          context.g16,

          const CompleteOrderItemWidget(),
          context.g8,
          const CompleteOrderItemWidget(),
          // const ThinDividerWidget(),
        ],
      )),
    );
  }
}
