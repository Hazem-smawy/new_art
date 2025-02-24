import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/routes/app_pages.dart';
import 'package:newart/src/features/home/presentation/widgets/main_icon_widget.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({
    super.key,
    required this.action,
    required this.isOpen,
    required this.globalKey,
  });

  final Function action;
  final bool isOpen;
  final GlobalKey<ScaffoldState> globalKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.TRACK_ORDER);
          },
          child: const MainIconWidget(
            inHome: true,
            icon: Icons.shopping_bag_outlined,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {},
          child: const MainIconWidget(
            inHome: true,
            icon: Icons.notifications_outlined,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            action();
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 100),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: MainIconWidget(
              key: ValueKey<bool>(
                  isOpen), // Ensures animation triggers on change
              inHome: true,
              icon: isOpen
                  ? Icons.keyboard_double_arrow_right
                  : Icons.keyboard_double_arrow_left,
            ),
          ),
        ),
        if (!isOpen)
          GestureDetector(
            onTap: () {
              globalKey.currentState?.openDrawer();
            },
            child: const MainIconWidget(
              inHome: true,
              icon: Icons.menu_outlined,
            ),
          ),
      ],
    );
  }
}
