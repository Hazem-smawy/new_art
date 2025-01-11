import 'package:intl/intl.dart';

String date2String(DateTime date) {
  return DateFormat('dd/mm/yyyy').format(date);
}

DateTime string2Date(String date) {
  return DateFormat('dd/mm/yyyy').parse(date);
}
