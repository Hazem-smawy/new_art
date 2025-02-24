import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/extensions/context_extensions.dart';

class ReusableCategoriesWithSearchWidget extends StatefulWidget {
  /// List of category names to display.
  final List<String> groups;
  final String allLabel;
  final String selected;

  /// Callback when the search field text changes.
  final ValueChanged<String>? onSearchChanged;

  /// Callback when a category is tapped. Provides the category name.
  final ValueChanged<String>? onCategoryTapped;

  /// Callback when the reset icon is tapped.
  final VoidCallback? onReset;

  const ReusableCategoriesWithSearchWidget({
    super.key,
    required this.groups,
    this.onSearchChanged,
    this.onCategoryTapped,
    this.onReset,
    required this.allLabel,
    required this.selected,
  });

  @override
  State<ReusableCategoriesWithSearchWidget> createState() =>
      _ReusableCategoriesWithSearchWidgetState();
}

class _ReusableCategoriesWithSearchWidgetState
    extends State<ReusableCategoriesWithSearchWidget> {
  bool isSearchFieldOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 40,
      child: Row(
        children: [
          // Search toggle button
          GestureDetector(
            onTap: () {
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
          // Search field or category list based on toggle state
          if (isSearchFieldOpen)
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: context.backgroundColor,
                ),
                child: TextFormField(
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: context.titleSmall.copyWith(
                    color: context.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: widget.onSearchChanged,
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
            )
          else
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  itemCount: widget.groups.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 5),
                  itemBuilder: (context, index) {
                    final group = widget.groups[index];
                    return GestureDetector(
                      onTap: () {
                        if (widget.onCategoryTapped != null) {
                          widget.onCategoryTapped!(group);
                        }
                      },
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: widget.selected == group
                              ? context.secondary
                              : const Color(0xffF1F2F6),
                        ),
                        child: Center(
                          child: Text(
                            group,
                            style: context.bodySmall.copyWith(
                              color: widget.selected == group
                                  ? context.whiteColor
                                  : context.secondaryTextColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          const SizedBox(width: 5),
          // Reset or alternative icon button based on search state
          if (isSearchFieldOpen)
            GestureDetector(
              onTap: () {
                setState(() {
                  isSearchFieldOpen = false;
                });
                if (widget.onReset != null) {
                  widget.onReset!();
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
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
            )
          else
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: widget.selected == widget.allLabel
                    ? context.secondary
                    : Color(0xffF1F2F6),
                border: Border.all(
                  color: context.secondaryTextColor.withAlpha(50),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  if (widget.onCategoryTapped != null) {
                    widget.onCategoryTapped!(widget.allLabel);
                  }
                },
                child: Center(
                  child: Text(
                    widget.allLabel,
                    style: context.bodySmall.copyWith(
                      color: widget.selected == widget.allLabel
                          ? context.whiteColor
                          : context.secondaryTextColor,
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
