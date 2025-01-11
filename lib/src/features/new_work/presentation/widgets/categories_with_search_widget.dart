import '../../../../core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CategoriesWithSearchWidget extends StatefulWidget {
  const CategoriesWithSearchWidget({super.key});

  @override
  State<CategoriesWithSearchWidget> createState() =>
      _CategoriesWithSearchWidgetState();
}

class _CategoriesWithSearchWidgetState
    extends State<CategoriesWithSearchWidget> {
  bool isSearchFieldOpen = false;
  List groups = ['شيلات ', "زفات"];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 40,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              // itemController.filterItemsByGroup(0);

              setState(() {
                isSearchFieldOpen = !isSearchFieldOpen;
              });
            },
            child: Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xffF1F2F6),
              ),
              child: Center(
                child: FaIcon(
                  Icons.search_outlined,
                  color: context.secondaryTextColor,
                  size: 22,
                ),
              ),
            ),
          ),
          context.g4,
          if (isSearchFieldOpen)
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(microseconds: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: context.backgroundColor,
                ),
                child: TextFormField(
                  //initialValue: widget.placeHolder ?? "",
                  textAlign: TextAlign.right,

                  textDirection: TextDirection.rtl,
                  style: context.titleSmall.copyWith(
                    color: context.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (value) {
                    // itemController.filterItemsBySearch(value);
                  },
                  onTap: () {},
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'البحث عن',
                    hintStyle: context.bodySmall.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                    contentPadding: const EdgeInsets.only(
                      right: 20,
                      left: 10,
                      bottom: 10,
                    ),
                  ),
                ),
              ),
            ),
          if (!isSearchFieldOpen)
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(microseconds: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // color: const Color(0xff777777),
                ),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  itemCount: groups.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 5,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    final group = groups[index];
                    return GestureDetector(
                      onTap: () {
                        // itemController.filterItemsByGroup(group.code);
                      },
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            // color: itemController.selectedGroupId.value ==
                            //         group.code
                            //     ? context.secondary
                            color: const Color(0xffF1F2F6)),
                        child: Center(
                          child: Text(
                            group,
                            style: context.bodySmall.copyWith(
                              // color: itemController.selectedGroupId.value ==
                              //         group.code
                              //     ? context.whiteColor
                              color: context.secondaryTextColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          const SizedBox(
            width: 5,
          ),
          if (isSearchFieldOpen)
            GestureDetector(
              onTap: () {
                // itemController.filterItemsByGroup(0);

                setState(() {
                  isSearchFieldOpen = false;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(microseconds: 200),
                height: 40,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: context.secondaryTextColor.withAlpha(50),
                  ),
                ),
                child: Center(
                  child: FaIcon(
                    Icons.music_note,
                    color: context.secondaryTextColor,
                    size: 20,
                  ),
                ),
              ),
            ),
          if (!isSearchFieldOpen)
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                // color: itemController.selectedGroupId.value == 0
                //     ? context.secondary
                color: context.secondary,
                border: Border.all(
                  color: context.secondaryTextColor.withAlpha(50),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  // itemController.filterItemsByGroup(0);
                },
                child: Center(
                  child: Text(
                    'الكل',
                    style: context.bodySmall.copyWith(
                      // color: itemController.selectedGroupId.value == 0
                      //     ? context.whiteColor
                      color: context.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
