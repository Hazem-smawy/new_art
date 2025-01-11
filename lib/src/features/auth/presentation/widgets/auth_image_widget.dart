import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthImageWidget extends StatelessWidget {
  const AuthImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: 200,
        // color: MyColors.darkBackgroundColor,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: SvgPicture.asset(
            'assets/images/logonav.svg',
            // width: 70,
            // height: 70,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
