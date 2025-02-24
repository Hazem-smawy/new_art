// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:newart/src/core/extensions/context_extensions.dart';

class LocalNotificationWidget extends StatelessWidget {
  final Widget action;
  final String title;
  final String details;
  const LocalNotificationWidget({
    super.key,
    required this.action,
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      color: Colors.orange.withAlpha(10),
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 12,
        bottom: 4,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // FaIcon(
              //   FontAwesomeIcons.xmark,
              //   size: 20,
              //   color: context.secondaryTextColor.withAlpha(200),
              // ),
              context.g28,
              Text(
                title,
                style: context.bodyLarge,
              ),
              context.g12,
              FaIcon(
                FontAwesomeIcons.triangleExclamation,
                size: 16,
                color: Colors.orange,
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  details,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: context.titleMedium.copyWith(
                    color: context.secondaryTextColor,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [action],
          )
        ],
      ),
    );
  }
}
