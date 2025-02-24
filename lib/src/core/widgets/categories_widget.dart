import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CategoriesWidget<T> extends StatelessWidget {
  final List<T> items;
  final Function(int?) action;

  final int selectedId;

  // New: Function to extract the id from an item
  final int Function(T) idExtractor;
  final String Function(T) nameExtractor;

  const CategoriesWidget({
    super.key,
    required this.items,
    required this.action,
    required this.selectedId,
    required this.idExtractor,
    required this.nameExtractor, // Pass a function to extract the ID
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      child: Row(
        children: [
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200), // Fixed duration
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemCount: items.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 5);
                },
                itemBuilder: (BuildContext context, int index) {
                  final item = items[index];
                  final itemId =
                      idExtractor(item); // Extract id using the passed function

                  return GestureDetector(
                    onTap: () {
                      action(itemId);
                    }, // Use extracted ID
                    child: CategoryItemWidget(
                      name: nameExtractor(item),
                      isSelected: itemId == selectedId, // Check if selected
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () => action(null), // Reset action (e.g., show all)
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: selectedId == 0 ? context.secondary : context.whiteColor,
                border: Border.all(
                  color: context.secondaryTextColor.withAlpha(50),
                ),
              ),
              child: Center(
                child: Text(
                  'الكل',
                  style: context.bodyMedium.copyWith(
                    color: selectedId == 0
                        ? context.whiteColor
                        : context.secondaryTextColor,
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

class CategoryItemWidget extends StatelessWidget {
  final bool isSelected;
  const CategoryItemWidget(
      {super.key, required this.name, required this.isSelected});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: isSelected ? context.secondary : context.whiteColor,
      ),
      child: Center(
        child: Text(
          name,
          style: context.bodySmall.copyWith(
            color: isSelected ? context.whiteColor : context.secondaryTextColor,
          ),
        ),
      ),
    );
  }
}
