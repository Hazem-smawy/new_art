import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeSliderWidget extends StatelessWidget {
  const HomeSliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(right: 16),
        reverse: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/s4.jpg',
                fit: BoxFit.cover,
                width: context.width - 200,
                scale: 2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/s1.jpg',
                fit: BoxFit.cover,
                width: context.width - 200,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/s3.jpg',
                fit: BoxFit.cover,
                width: context.width - 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
