import 'package:flutter/material.dart';
import 'package:new_art/src/core/extensions/context_extensions.dart';
import 'package:new_art/src/core/extensions/padding_extension.dart';
import 'package:new_art/src/core/widgets/header_widget.dart';
import 'package:new_art/src/features/auth/presentation/pages/recover_password_page.dart';

class BunchPage extends StatelessWidget {
  const BunchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderWidget(title: 'الباقات'),
            context.g16,
            Column(
              children: [
                BunchItemWidget(),
                context.g8,
                BunchItemWidget(),
              ],
            ).ph(16)
          ],
        ),
      ),
    );
  }
}

class BunchItemWidget extends StatelessWidget {
  const BunchItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        border: Border.all(color: context.secondaryTextColor.withAlpha(50)),
        borderRadius: BorderRadius.circular(10),
        // color: context.containerColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'اسم',
            style: context.titleMedium,
          ),
          context.g8,
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Spacer(),
              Text(
                'ر.س/شهر',
                style: context.bodySmall,
              ),
              context.g4,
              Text(
                '1000',
                style: context.displayLarge,
              ),
            ],
          ),
          context.g8,
          Text(
            'شرح اهمية الباقة وفوائدها ب اختصار',
            style: context.bodySmall.copyWith(
              color: context.blackColor,
            ),
          ),
          context.g20,
          CustomBtnWithIconWidget(
            title: 'الحصول على الباقة',
            action: () {},
          ),
          context.g20,
          BunchItemFeatureWidget(
            title: 'شرح اهمية الباقة وفوائدها ب اختصار',
          ),
          context.g8,
          BunchItemFeatureWidget(
            title: 'الحصول على الباقة',
          ),
          context.g8,
          BunchItemFeatureWidget(
            title: 'شرح اهمية الباقة وفوائدها ب اختصار',
          ),
        ],
      ),
    );
  }
}

class BunchItemFeatureWidget extends StatelessWidget {
  final String title;
  const BunchItemFeatureWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          title,
          style: context.bodyMedium.copyWith(
            color: context.blackColor,
          ),
        ),
        context.g12,
        Icon(
          Icons.check,
          size: 17,
          color: context.secondaryTextColor,
        ),
      ],
    );
  }
}
