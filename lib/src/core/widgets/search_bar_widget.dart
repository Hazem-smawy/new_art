import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchAppbarWidget extends StatelessWidget {
  const SearchAppbarWidget({
    super.key,
    required this.action,
    this.color,
  });
  final Function(String) action;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: color ?? context.whiteColor,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    //initialValue: widget.placeHolder ?? "",
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: context.bodyLarge.copyWith(
                      color: context.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                    onChanged: (value) {
                      action(value);
                    },
                    onTap: () {},
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'البحث عن',
                      hintStyle: context.bodyMedium.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusColor: Colors.transparent,
                      contentPadding: const EdgeInsets.only(
                        right: 10,
                        bottom: 10,
                      ),
                    ),
                  ),
                ),
                // const SizedBox(
                //   width: 5,
                // ),
                Icon(
                  Icons.search,
                  size: 20,
                  color: context.secondaryTextColor,
                ),
                context.g12,
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.chevron_right_outlined,
            size: 27,
            color: context.secondaryTextColor,
          ),
        )
      ],
    );
  }
}
