import 'package:flutter/material.dart';
import 'package:newart/src/core/extensions/context_extensions.dart';
import 'package:newart/src/core/extensions/padding_extension.dart';

class TimelineTile extends StatelessWidget {
  final String label;
  final String date;
  final bool isCompleted;
  final Color color;
  final IconData icon;
  final bool isLeft;
  final bool selected;

  const TimelineTile({
    super.key,
    required this.label,
    required this.date,
    required this.isCompleted,
    required this.color,
    required this.icon,
    required this.isLeft,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SizedBox(
        //   width: context.width / 2,
        // ),
        if (isLeft) Expanded(child: Container()),

        if (!isLeft)
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                context.g12,
                if (selected)
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 25,
                  ).pt(32),
                Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      label,
                      style: context.bodyLarge.copyWith(
                        color: context.blackColor,
                      ),
                    ),
                    if (date == '0000-00-00')
                      Icon(
                        Icons.timer_outlined,
                        size: 15,
                        color: context.secondaryTextColor,
                      )
                    else
                      Text(
                        date,
                        style: context.bodySmall,
                      ),
                  ],
                ),
              ],
            ),
          ),
        SizedBox(width: 16),
        Column(
          children: [
            Container(
              width: 1,
              height: 37,
              color: isCompleted ? color : Colors.grey[300],
            ),
            CircleAvatar(
              backgroundColor: isCompleted ? color : Colors.grey[100],
              radius: 15,
              child: Icon(
                icon,
                color: isCompleted ? Colors.white : Colors.black54,
                size: 18,
              ),
            ),
          ],
        ),
        SizedBox(width: 16),
        if (!isLeft) Expanded(child: Container()),

        if (isLeft)
          Expanded(
            child: Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      label,
                      style: context.bodyLarge.copyWith(
                        color: context.blackColor,
                      ),
                    ),
                    if (date == '0000-00-00')
                      Icon(
                        Icons.timer_outlined,
                        size: 15,
                        color: context.secondaryTextColor,
                      )
                    else
                      Text(
                        date,
                        style: context.bodySmall,
                      ),
                  ],
                ),
                Spacer(),
                if (selected)
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 25,
                  ).pt(33),
                context.g12,
              ],
            ),
          ),
      ],
    );
  }
}
