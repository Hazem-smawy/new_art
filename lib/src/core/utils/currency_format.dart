import 'package:intl/intl.dart';

String currencyFormat({required String number}) {
  return NumberFormat.currency(symbol: '', decimalDigits: 2)
      .format(double.parse(number));
}

String accountNumberFormat({required String number}) {
  return number.replaceAllMapped(
    RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
    (Match m) => '${m[1]} ',
  );
}
