import 'package:intl/intl.dart';

String formatDateToArabic(DateTime date) {
  // Use the 'ar' locale for Arabic formatting

  final formatter = DateFormat.yMEd('ar');
  return formatter.format(date);
}
