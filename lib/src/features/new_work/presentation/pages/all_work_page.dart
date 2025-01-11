// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:new_art/src/core/extensions/context_extensions.dart';
import 'package:new_art/src/core/extensions/padding_extension.dart';
import 'package:new_art/src/core/widgets/header_widget.dart';
import 'package:new_art/src/core/widgets/thin_divider_widget.dart';

import '../widgets/categories_with_search_widget.dart';

class AllWorkPage extends StatelessWidget {
  const AllWorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      body: SafeArea(
          child: Column(
        children: [
          const HeaderWidget(title: 'الحصريات'),
          context.g12,
          CategoriesWithSearchWidget(),
          context.g16,
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => WorkItemWidget(),
            separatorBuilder: (context, index) => ThinDividerWidget(),
            itemCount: 3,
          )
        ],
      )),
    );
  }
}

class WorkItemWidget extends StatelessWidget {
  const WorkItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          Container(
            width: double.infinity,
            height: context.height / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: context.containerColor,
            ),
          ),
        );
      },
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
          padding: EdgeInsets.symmetric(
            horizontal: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            // border: Border.all(
            //   color: context.secondaryTextColor.withAlpha(70),
            // ),
          ),

          // height: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'اسم الفنان',
                    style: context.bodyMedium,
                  ),
                  context.g8,
                  Icon(
                    Icons.person_outline,
                    size: 20,
                    color: context.secondaryTextColor,
                  ),
                  Spacer(),
                  Text(
                    'اسم الزفة',
                    style: context.displayMedium,
                  ),
                  context.g8,
                  Icon(
                    Icons.play_circle_outline,
                    size: 25,
                    color: context.secondaryTextColor,
                  )
                ],
              ),
              context.g4,
              Row(
                children: [
                  Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green.withAlpha(10),
                    ),
                    child: Text(
                      'بدون موسيقى',
                      style: context.bodySmall.copyWith(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
              context.g12,
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(
                      //   width: context.width / 3.5,
                      //   child: ThinDividerWidget(),
                      // ),
                      Row(
                        spacing: context.sp28,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          WorkItemIconItemWidget(
                            icon: Icons.headphones_outlined,
                            label: 'k100',
                          ),
                          WorkItemIconItemWidget(
                            icon: Icons.share_outlined,
                            label: 'k100',
                          ),
                          WorkItemIconItemWidget(
                            icon: Icons.download_outlined,
                            label: 'k100',
                          )
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  IconButton.outlined(
                    style: ButtonStyle(
                      side:
                          WidgetStateProperty.resolveWith<BorderSide>((states) {
                        if (states.contains(WidgetState.pressed)) {
                          return BorderSide(
                            color: Colors.black,
                            width: 1,
                          ); // Border color when pressed
                        }
                        return BorderSide(
                          color: context.secondaryTextColor.withAlpha(50),
                          width: 1,
                        ); // Default border color
                      }),
                    ),
                    color: Theme.of(context).colorScheme.secondary,
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      size: 20,
                    ),
                  ),
                  context.g4,
                  IconButton.filled(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_shopping_cart_outlined,
                      size: 20,
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}

class WorkItemIconItemWidget extends StatelessWidget {
  final IconData icon;
  String? label;
  WorkItemIconItemWidget({
    super.key,
    required this.icon,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: context.secondaryTextColor,
          size: 20,
        ),
        context.g4,
        if (label != null)
          Text(
            label!,
            style: context.bodySmall,
          )
      ],
    );
  }
}
