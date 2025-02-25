import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/extensions/padding_extension.dart';
import 'package:newart/src/core/routes/app_pages.dart';
import 'package:newart/src/core/widgets/beautiful_simple_loading.dart';
import 'package:newart/src/core/widgets/error_state_widget.dart';
import 'package:newart/src/core/widgets/thin_divider_widget.dart';
import 'package:newart/src/features/exclusive/presentation/widgets/empty_widget.dart';
import 'package:newart/src/features/exclusive/presentation/widgets/exclusive_widget.dart';
import 'package:newart/src/features/home/presentation/getX/home_controller.dart';
import 'package:newart/src/features/home/presentation/widgets/home_artist_widget.dart';
import 'package:newart/src/features/home/presentation/widgets/home_our_recent_work_widget.dart';
import 'package:newart/src/features/home/presentation/widgets/home_slider_widget.dart';
import 'package:newart/src/features/home/presentation/widgets/home_service_widget.dart';
import 'package:newart/src/features/home/presentation/widgets/news_item_widget.dart';

import '../../../../../core/types/status_types.dart';
import '../../../../user/presentation/widgets/short_report_for_user_widget.dart';
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

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: widget.width,
      // color: context.backgroundColor,
      child: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => homeController.fetchHomeData(),
          child: ListView(
            children: [
              context.g12,
              HomeAppBarWidget(
                action: widget.action,
                isOpen: widget.isOpen,
                globalKey: widget.globalKey,
              ),
              // HomeNotificationWidget(),

              context.g28,

              // const HomeTitleWidget().pr(16).pt(20),

              Obx(
                () => ShortReportForUserWidget(
                  pointsModel: homeController.points.value,
                ),
              ),
              context.g12,

              context.g12,
              const HomwServiceWidget().pr(16),
              // slide
              Obx(() {
                switch (homeController.homeStatus.value) {
                  case Status.loading:
                    return BeautifulSimpleLoading();
                  case Status.success:
                    return _builHomePage();
                  default:
                    return ErrorStateWidget(
                      onRetry: () {
                        homeController.fetchHomeData();
                      },
                    );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _builHomePage() {
    return Column(
      children: [
        context.g12,
        HomeSliderWidget(),
        context.g12,
        // const ThinDividerWidget(),

        //current_booking

        context.g16,
        HomeOurRecentWorkWidget(),
        context.g12,
        const ThinDividerWidget(),

        if (homeController.homeData.value?.exclusive != null)
          ExclusiveHomeWidget(
            items:
                homeController.homeData.value?.exclusive.take(4).toList() ?? [],
          )
        else
          EmptyWidget(action: () {
            Get.toNamed(Routes.ADD_ORDER);
          }),

        const HomeArtistWidget(),

        const ThinDividerWidget(),

        context.g8,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            context.g12,
            // Text(
            //   'كل الفنانين',
            //   style: context.bodySmall,
            //   textAlign: TextAlign.right,
            // ),
            const Spacer(),
            Text(
              'اخر الاخبار',
              style: context.displayLarge,
              textAlign: TextAlign.right,
            ),
          ],
        ).ph(16),
        context.g8,
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: homeController.homeData.value!.news.length,
          separatorBuilder: (BuildContext context, int index) {
            return ThinDividerWidget();
          },
          itemBuilder: (BuildContext context, int index) {
            return NewsItemWidget(
              newsItem: homeController.homeData.value!.news[index],
            );
          },
        ),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }
}

// Data model (expand with all fields as needed)
