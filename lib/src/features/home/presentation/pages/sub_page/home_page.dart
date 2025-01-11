import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:new_art/src/core/extensions/context_extensions.dart';
import 'package:new_art/src/core/extensions/padding_extension.dart';
import 'package:new_art/src/core/routes/app_pages.dart';
import 'package:new_art/src/core/widgets/thin_divider_widget.dart';
import 'package:new_art/src/features/home/presentation/widgets/home_artist_widget.dart';
import 'package:new_art/src/features/home/presentation/widgets/home_our_recent_work_widget.dart';
import 'package:new_art/src/features/home/presentation/widgets/home_slider_widget.dart';
import 'package:new_art/src/features/home/presentation/widgets/home_title_widget.dart';
import 'package:new_art/src/features/home/presentation/widgets/home_service_widget.dart';
import 'package:new_art/src/features/user/presentation/widgets/short_report_for_user_widget.dart';

import '../../widgets/home_app_bar_widget.dart';

class HomePage extends StatefulWidget {
  final Function action;
  final bool isOpen;

  const HomePage({
    super.key,
    required this.action,
    required this.globalKey,
    required this.isOpen,
  });
  final GlobalKey<ScaffoldState> globalKey;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String user = "";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: widget.width,
      // color: context.backgroundColor,
      child: SafeArea(
        child: ListView(
          children: [
            // Padding(
            // padding: const EdgeInsets.only(right: 15),
            Column(
              children: [
                context.g12,
                HomeAppBarWidget(
                  action: widget.action,
                  isOpen: widget.isOpen,
                  globalKey: widget.globalKey,
                ),
                HomeNotificationWidget(),
                context.g28,

                // const HomeTitleWidget().pr(16),

                ShortReportForUserWidget(),
                context.g12,

                context.g12,

                const HomwServiceWidget().pr(16),
                // slide

                context.g12,
                const HomeSliderWidget(),
                context.g12,
                // const ThinDividerWidget(),

                //current_booking
              ],
            ),
            // ),
            context.g16,
            const HomeOurRecentWorkWidget(),
            context.g12,
            const ThinDividerWidget(),
            context.g12,
            const HomeArtistWidget(),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

class HomeNotificationWidget extends StatelessWidget {
  const HomeNotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      color: Colors.orange.withAlpha(10),
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 12,
        bottom: 4,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FaIcon(
                FontAwesomeIcons.xmark,
                size: 20,
                color: context.secondaryTextColor.withAlpha(200),
              ),
              context.g28,
              Expanded(
                child: Text(
                  'للإستفادة الكاملة من خدمات التطبيق قم بتسجيل الدخول',
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: context.titleMedium.copyWith(
                    color: context.secondaryTextColor,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              context.g12,
              FaIcon(
                FontAwesomeIcons.triangleExclamation,
                size: 20,
                color: Colors.orange,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'الغاء',
                  style: context.titleLarge.copyWith(
                    color: Colors.red,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.AUTH);
                  },
                  child: Text(
                    'تسجيل',
                    style: context.titleLarge.copyWith(
                      color: context.blackColor,
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
