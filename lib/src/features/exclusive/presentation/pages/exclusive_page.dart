import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/types/status_types.dart';
import 'package:newart/src/core/widgets/beautiful_simple_loading.dart';
import 'package:newart/src/core/widgets/error_state_widget.dart';

import 'package:newart/src/core/widgets/header_widget.dart';
import 'package:newart/src/features/exclusive/presentation/getX/exclusive_controller.dart';
import 'package:newart/src/features/exclusive/presentation/widgets/empty_widget.dart';
import 'package:newart/src/features/exclusive/presentation/widgets/exclusive_widget.dart';

import '../../../audio_player/presentation/getX/audio_player_controller.dart';

class AllExclusivePage extends StatefulWidget {
  const AllExclusivePage({super.key});

  @override
  State<AllExclusivePage> createState() => _AllExclusivePageState();
}

class _AllExclusivePageState extends State<AllExclusivePage> {
  final AudioController audioController = Get.find();

  ExclusiveController exclusiveController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const HeaderWidget(title: 'الحصريات'),
                  // context.g16,
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Obx(() {
                      switch (exclusiveController.exclusiveStatus.value) {
                        case Status.success:
                          return ExclusiveListView(
                            items:
                                exclusiveController.allExclusive.value?.data ??
                                    [],
                          );

                        case Status.loading:
                          return BeautifulSimpleLoading();
                        case Status.error:
                          return ErrorStateWidget(
                            onRetry: exclusiveController.fetchAllExclusive,
                          );
                        case Status.initial:
                          return EmptyWidget(action: () {
                            exclusiveController.fetchAllExclusive();
                          });
                      }
                    }),
                  ),
                  context.g36,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
