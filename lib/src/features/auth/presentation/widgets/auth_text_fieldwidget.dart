// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_art/src/core/extensions/context_extensions.dart';

class AuthTextFieldwidget extends StatelessWidget {
  final IconData icon;
  final String hint;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  TextInputType? type;
  String? lan;

  AuthTextFieldwidget({
    super.key,
    required this.icon,
    required this.hint,
    this.validator,
    required this.controller,
    this.type,
    this.lan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.whiteColor.withAlpha(200),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                textAlign: TextAlign.right,
                textDirection: lan != null && lan == 'en'
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                keyboardType: type,
                validator: validator,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),

                  //contentPadding: EdgeInsets.only(right: 15),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            FaIcon(
              icon,
              color: Theme.of(context).hintColor,
              size: 15,
            ),
            const SizedBox(
              width: 5,
            )
          ],
        ),
      ),
    );
  }
}
