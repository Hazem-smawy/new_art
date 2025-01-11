import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as date;
import 'package:new_art/src/core/extensions/context_extensions.dart';
import 'package:new_art/src/core/extensions/padding_extension.dart';
import 'package:new_art/src/core/widgets/header_widget.dart';
import 'package:new_art/src/core/widgets/thin_divider_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class PointsStaticsPage extends StatefulWidget {
  const PointsStaticsPage({super.key});

  @override
  State<PointsStaticsPage> createState() => _PointsStaticsPageState();
}

class _PointsStaticsPageState extends State<PointsStaticsPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  DateTime? _startDay;
  DateTime? _endDay;
  var _calendarFormat = CalendarFormat.week;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            HeaderWidget(title: 'نقاطي'),
            // ThinDividerWidget(),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TableCalendar(
                locale: 'ar',
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: _focusedDay,
                startingDayOfWeek: StartingDayOfWeek.saturday,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                rangeSelectionMode: RangeSelectionMode.toggledOn,
                onRangeSelected: (start, end, focusedDay) {
                  setState(() {
                    _startDay = start;
                    _endDay = end;
                  });
                },
                // rangeEndDay: _startDay,
                // rangeStartDay: _endDay,

                headerStyle: HeaderStyle(
                  titleTextStyle: context.titleLarge,
                  formatButtonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: context.secondaryTextColor.withAlpha(50),
                    ),
                  ),
                ),
                calendarBuilders: CalendarBuilders(
                  dowBuilder: (context, day) {
                    final text = date.DateFormat.E('ar').format(day);

                    return Center(
                      child: Text(
                        text,
                        style: context.bodySmall,
                      ),
                    );
                  },
                ),
                calendarFormat: _calendarFormat,
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay =
                        focusedDay; // update `_focusedDay` here as well
                  });
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                  setState(() {});
                },
              ),
            ),
            // ThinDividerWidget(),
            context.g20,
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'النقاط',
                style: context.titleLarge,
              ),
            ).pr(16),
            context.g12,
            Container(
              clipBehavior: Clip.hardEdge,
              // margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: context.secondaryTextColor.withAlpha(40),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        'نقطة',
                        style: context.bodySmall,
                      ),
                      context.g12,
                      Text(
                        '10',
                        style: context.displayLarge,
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(16),
                        width: context.width / 3,
                        color: context.primary,
                        child: Center(
                          child: Text(
                            'الثلاثاء',
                            style: context.bodyLarge.copyWith(
                              color: context.whiteColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
