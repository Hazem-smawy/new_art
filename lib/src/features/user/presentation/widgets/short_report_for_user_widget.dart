import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/routes/app_pages.dart';
import 'package:newart/src/core/widgets/thin_divider_widget.dart';
import 'package:newart/src/features/home/data/models/points_model.dart';

class ShortReportForUserWidget extends StatelessWidget {
  const ShortReportForUserWidget({
    super.key,
    required this.pointsModel,
  });
  final PointsModel pointsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      // padding: const EdgeInsets.all(12),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(8),
      //   border: Border.all(
      //     color: context.secondaryTextColor.withAlpha(50),
      //   ),
      // ),
      child: Column(
        children: [
          AccountPointSammaryWidget(
            points: pointsModel,
          ),
          context.g8,
          ThinDividerWidget(),
          context.g8,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ServiceItemWidget(
                color: Colors.blue,
                action: () {
                  Get.toNamed(Routes.WALLET);
                },
                label: 'محفضتي',
                icon: Icons.wallet_outlined,
              ),
              ServiceItemWidget(
                color: Colors.green,
                action: () {
                  Get.toNamed(Routes.USER);
                },
                label: 'صفحتي',
                icon: Icons.person_outline,
              ),
              ServiceItemWidget(
                color: Colors.pink,
                action: () {
                  Get.toNamed(Routes.BUNCH);
                },
                label: 'الباقات',
                icon: Icons.credit_card_outlined,
              ),
              ServiceItemWidget(
                color: Colors.purple,
                action: () {
                  Get.toNamed(Routes.POINTS);
                },
                label: 'نقاطي',
                icon: Icons.auto_awesome_outlined,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AccountPointSammaryWidget extends StatelessWidget {
  PointsModel points;
  AccountPointSammaryWidget({
    super.key,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'حسابي',
              style: context.bodyLarge,
            ),
            Row(
              children: [
                const FaIcon(
                  FontAwesomeIcons.arrowTrendDown,
                  color: Colors.red,
                  size: 20,
                ),
                context.g12,
                Text(
                  'RS',
                  style: context.bodyLarge,
                ),
                context.g4,
                Text(
                  '1000-',
                  style: context.displayLarge,
                )
              ],
            )
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'نقاطي',
              style: context.bodyLarge,
            ),
            Row(
              children: [
                Text(
                  points.points.toString(),
                  style: context.displayLarge,
                ),
                context.g12,
                const FaIcon(
                  FontAwesomeIcons.arrowUp,
                  color: Colors.green,
                  size: 20,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class ServiceItemWidget extends StatelessWidget {
  const ServiceItemWidget({
    super.key,
    required this.color,
    required this.action,
    required this.label,
    required this.icon,
  });
  final Color color;
  final String label;
  final VoidCallback action;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => action(),
      child: Column(
        children: [
          Container(
            // height: context.width / 5.6,
            // width: context.width / 5.6,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withAlpha(15),
            ),
            child: Icon(
              icon,
              color: color,
              size: 23,
            ),
          ),
          context.g4,
          SizedBox(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
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
    );
  }
}
