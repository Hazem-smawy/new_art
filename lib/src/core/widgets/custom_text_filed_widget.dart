import 'package:newart/src/core/constants/spaces_sizes.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget(
      {super.key,
      required this.controller,
      this.label = '',
      this.isNumber = false,
      this.hint = '',
      this.isEnglish = false,
      this.validator,
      this.textInputType = TextInputType.text,
      this.minLine = 1,
      this.maxLine = 1});
  final TextEditingController controller;
  final String label;
  final bool isNumber;
  final String hint;
  final String? Function(String?)? validator;
  final bool isEnglish;
  final TextInputType textInputType;
  final int minLine;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (label.isNotEmpty)
          Text(
            label,
            style: context.bodyLarge,
          ),
        if (label.isNotEmpty) Gaps.g4,
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            controller: controller,
            keyboardType: textInputType,
            textAlign: TextAlign.right,
            minLines: minLine,
            maxLines: maxLine,
            textDirection: isEnglish ? TextDirection.ltr : TextDirection.rtl,
            style: context.titleMedium,
            validator: validator,
            decoration: InputDecoration(
                fillColor: context.whiteColor,
                hintStyle: context.bodySmall.copyWith(
                  fontWeight: FontWeight.normal,
                ),
                hintText: hint,
                filled: true,
                floatingLabelAlignment: FloatingLabelAlignment.center,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.only(
                  right: 8,
                  top: 4,
                  bottom: 4,
                  left: 8,
                )),
          ),
        ),
      ],
    );
  }
}

class ExchangeCustomTextFiled extends StatelessWidget {
  const ExchangeCustomTextFiled(
      {super.key,
      required this.controller,
      this.label = '',
      this.isNumber = false,
      this.hint = '',
      this.validator});
  final TextEditingController controller;
  final String label;
  final bool isNumber;
  final String hint;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (label.isNotEmpty)
          Text(
            label,
            style: context.bodyLarge,
          ),
        if (label.isNotEmpty) Gaps.g8,
        SizedBox(
          height: 55,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: TextFormField(
              controller: controller,
              keyboardType:
                  isNumber ? TextInputType.number : TextInputType.name,
              textAlign: TextAlign.right,
              textDirection: isNumber ? TextDirection.ltr : TextDirection.rtl,
              style: context.bodyLarge,
              validator: validator,
              decoration: InputDecoration(
                fillColor: context.whiteColor,
                hintStyle: context.bodySmall.copyWith(
                  fontWeight: FontWeight.normal,
                ),
                hintText: hint,
                filled: true,
                floatingLabelAlignment: FloatingLabelAlignment.center,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
