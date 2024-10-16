import 'package:intl/intl.dart';

String rupiahFormat(num number) {
  if (number <= 0) {
    return 'Rp 0';
  }
  return NumberFormat.currency(symbol: 'Rp ', locale: 'id_ID', decimalDigits: 0)
      .format(number)
      .replaceAll(',', '.');
}

String numberFormat({
  required num number,
  String symbol = '',
}) {
  return NumberFormat.currency(
    symbol: symbol,
    locale: 'id_ID',
    decimalDigits: 0,
  ).format(number).replaceAll(',', '.');
} 
