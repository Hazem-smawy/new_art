// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_art/src/core/extensions/context_extensions.dart';

class AuthSocialMediaItemWidget extends StatelessWidget {
  final IconData icon;
  const AuthSocialMediaItemWidget({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        // shape: BoxShape.circle,
        border: Border.all(
          color: context.secondaryTextColor.withAlpha(50),
        ),
      ),
      child: Center(
        child: FaIcon(
          icon,
          size: 20,
          color: Theme.of(context).hintColor,
        ),
      ),
    );
  }
}
