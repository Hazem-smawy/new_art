// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_art/src/features/auth/presentation/widgets/auth_social_media_item_widget.dart';
import 'package:new_art/src/features/auth/presentation/widgets/login_widget.dart';

class SocialMedialWidget extends StatelessWidget {
  const SocialMedialWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AuthSocialMediaItemWidget(
            icon: FontAwesomeIcons.facebook,
          ),
          AuthSocialMediaItemWidget(
            icon: FontAwesomeIcons.whatsapp,
          ),
          AuthSocialMediaItemWidget(
            icon: FontAwesomeIcons.phone,
          ),
          AuthSocialMediaItemWidget(
            icon: FontAwesomeIcons.instagram,
          ),
        ],
      ),
    );
  }
}
