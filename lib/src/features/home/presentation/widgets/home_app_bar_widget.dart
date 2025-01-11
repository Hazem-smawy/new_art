// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:new_art/src/core/routes/app_pages.dart';
// import 'package:new_art/src/features/home/presentation/widgets/main_icon_widget.dart';

// import '../pages/main_page.dart';

// class HomeAppBarWidget extends StatelessWidget {
//   const HomeAppBarWidget({
//     super.key,
//     required this.action,
//     required this.isOpen,
//     required this.globalKey,
//   });
//   final Function action;
//   final bool isOpen;
//   final GlobalKey<ScaffoldState> globalKey;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(
//           width: 10,
//         ),
//         GestureDetector(
//           onTap: () {
//             Get.toNamed(Routes.ALL_ORDER);
//           },
//           child: const MainIconWidget(
//             inHome: true,
//             icon: Icons.shopping_bag_outlined,
//           ),
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         GestureDetector(
//           onTap: () {},
//           child: const MainIconWidget(
//             inHome: true,
//             icon: Icons.search_outlined,
//           ),
//         ),
//         const Spacer(),
//         GestureDetector(
//           onTap: () {
//             action();
//           },
//           child: MainIconWidget(
//             inHome: true,
//             icon: isOpen
//                 ? Icons.keyboard_double_arrow_right
//                 : Icons.keyboard_double_arrow_left,
//           ),
//         ),
//         if (!isOpen)
//           GestureDetector(
//             onTap: () {
//               // action();
//               globalKey.currentState?.openDrawer();
//             },
//             child: const MainIconWidget(
//               inHome: true,
//               icon: Icons.menu_outlined,
//             ),
//           ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_art/src/core/routes/app_pages.dart';
import 'package:new_art/src/features/home/presentation/widgets/main_icon_widget.dart';

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
            Get.toNamed(Routes.SHOPPING_CART);
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
