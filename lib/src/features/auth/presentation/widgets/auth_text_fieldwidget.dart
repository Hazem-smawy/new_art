// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';

class AuthTextFieldwidget extends StatefulWidget {
  final IconData icon;
  final String hint;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  TextInputType? type;
  String? lan;
  final bool isPassword;

  AuthTextFieldwidget({
    super.key,
    required this.icon,
    required this.hint,
    this.validator,
    required this.controller,
    this.type,
    this.lan,
    this.isPassword = false,
  });

  @override
  State<AuthTextFieldwidget> createState() => _AuthTextFieldwidgetState();
}

class _AuthTextFieldwidgetState extends State<AuthTextFieldwidget> {
  bool isPassShowing = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,

      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(20),
      //   color: context.whiteColor.withAlpha(200),
      // ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                  obscureText: isPassShowing && widget.isPassword,
                  controller: widget.controller,
                  textAlign: TextAlign.right,
                  textDirection: widget.lan != null && widget.lan == 'en'
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  style: context.titleMedium,
                  keyboardType: widget.type,
                  validator: widget.validator,
                  decoration: InputDecoration(
                    prefixIcon: SizedBox(
                      width: 40,
                      height: 40,
                      child: Center(
                        child: FaIcon(
                          widget.icon,
                          color: Theme.of(context).hintColor,
                          size: 17,
                        ),
                      ),
                    ),
                    suffixIcon: widget.isPassword
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                isPassShowing = !isPassShowing;
                              });
                            },
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: Center(
                                child: FaIcon(
                                  !isPassShowing
                                      ? Icons.visibility_off_outlined
                                      : Icons.remove_red_eye_outlined,
                                  color: Theme.of(context).hintColor,
                                  size: 17,
                                ),
                              ),
                            ),
                          )
                        : null,
                    filled: true,
                    fillColor: context.whiteColor.withAlpha(200),
                    hintText: widget.hint,
                    hintStyle: context.bodyMedium,
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 0.8,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 0.8,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.only(
                      right: 15,
                      top: 5,
                      bottom: 5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
