import 'package:intl/intl.dart';

String date2String(DateTime date) {
  return DateFormat('dd/mm/yyyy').format(date);
}

DateTime string2Date(String date) {
  return DateFormat('dd/mm/yyyy').parse(date);
}

String timeString2String(String time) {
  DateTime dateTime = DateTime.parse(time);

  final formatter = DateFormat.yMEd('ar');
  // Format the DateTime
  String formattedDate = formatter.format(dateTime);
  return formattedDate;
}
