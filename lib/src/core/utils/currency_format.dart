import 'package:intl/intl.dart';

String currencyFormat({required String number}) {
  
  return NumberFormat.currency(symbol: '', decimalDigits: 2)
      .format(double.parse(number));
}
