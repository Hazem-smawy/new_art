import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/extensions/padding_extension.dart';
import 'package:newart/src/core/widgets/header_widget.dart';
import 'package:newart/src/features/home/presentation/getX/home_controller.dart';
import 'package:newart/src/features/user/presentation/widgets/short_report_for_user_widget.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key});
  HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            const HeaderWidget(title: 'صفحتي'),
            context.g20,
            CircleAvatar(
              radius: 40,
              backgroundColor: context.primary,
              backgroundImage: const AssetImage('assets/images/face2.jpg'),
            ),
            context.g8,
            Text(
              'محمد السماوي',
              style: context.displayLarge,
            ),
            context.g20,
            // ShortReportForUserWidget()
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: context.secondaryTextColor.withAlpha(50),
                ),
              ),
              child: AccountPointSammaryWidget(
                  points: homeController.points.value),
            ),
            context.g16,
            Row(
              spacing: 16,
              children: [
                UserItemWidget(),
                UserItemWidget(),
              ],
            ).ph(16)
          ],
        ),
      ),
    );
  }
}

class UserItemWidget extends StatelessWidget {
  const UserItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: context.secondaryTextColor.withAlpha(50),
          ),
        ),
        child: GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'التعديلات',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    style: context.bodyMedium.copyWith(
                      color: context.blackColor,
                    ),
                  ),
                ),
              ),
              context.g12,
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.primary,
                ),
                child: Icon(
                  Icons.music_note,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
