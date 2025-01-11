import 'package:flutter/material.dart';
import 'package:new_art/src/core/extensions/context_extensions.dart';
import 'package:new_art/src/features/home/presentation/pages/sub_page/home_page.dart';

import '../widgets/drawer_widget.dart';
import 'sub_page/slide_bar_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late double fullSliderBarWidth;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    )..addListener(() {
        setState(() {}); // Rebuild UI on animation updates.
      });

    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fullSliderBarWidth = MediaQuery.of(context).size.width * 0.17;
    // _animationController.forward();
  }

  void toggleAnimation() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      key: _globalKey,
      drawer: const MyDrawerWidget(),
      body: Stack(
        children: [
          // HomePage - Main Content
          Positioned(
            left: 0,
            right: fullSliderBarWidth * _animation.value,
            top: 0,
            bottom: 0,
            child: HomePage(
              action: toggleAnimation,
              globalKey: _globalKey,
              isOpen: _animation.value > 0,
            ),
          ),
          // SlideBarWidget - Sliding Sidebar
          Positioned(
            right: _animation.value > 0 ? 0 : -fullSliderBarWidth,
            top: 0,
            bottom: 0,
            width: fullSliderBarWidth,
            child: Opacity(
              opacity: _animation.value,
              child: Transform.scale(
                alignment: Alignment.centerRight,
                scaleX: _animation.value,
                child: SlideBarWidget(
                  action: () {
                    _globalKey.currentState?.openDrawer();
                    setState(() {});
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _animation.value > 0
          ? null
          // : IconButton.filledTonal(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.add_shopping_cart_outlined,
          //     ),
          //   ),

          : FloatingActionButton(
              onPressed: () {},
              child: Icon(
                Icons.add_shopping_cart_outlined,
              ),
            ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

// Dummy HomePage Widget
