import 'package:flutter/material.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';

class BeautifulSimpleLoading extends StatefulWidget {
  const BeautifulSimpleLoading({super.key});

  @override
  _BeautifulSimpleLoadingState createState() => _BeautifulSimpleLoadingState();
}

class _BeautifulSimpleLoadingState extends State<BeautifulSimpleLoading>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // The controller drives the rotation animation.
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
        ),
        RotationTransition(
          turns: _controller,
          child: Icon(
            Icons.autorenew,
            color: context.primaryColor,
            size: 40,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'جاري التحميل',
          style: context.bodyLarge,
        ),
      ],
    );
  }
}
