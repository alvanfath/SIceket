import 'package:intl/intl.dart';

String shortText(String text, int maxLength) {
  if (text.length > maxLength) {
    return '${text.substring(0, maxLength)}...';
  }
  return text;
}

String createAlias(String name) {
  if (name == '') {
    return '';
  }
  try {
    final List<String> parts =
        name.trim().split(' ').where((part) => part.isNotEmpty).toList();

    if (parts.isEmpty) {
      return '';
    }
    if (parts.length == 1) {
      final part = parts[0];
      if (part.length == 1) {
        return part[0].toUpperCase();
      }
      final text = '${part[0]}${part[1]}';
      return text.toUpperCase();
    }

    final String alias = parts.first[0] + parts.last[0];
    return alias.toUpperCase();
  } catch (e) {
    return name.substring(0, 1);
  }
}

String dateFormat({
  String format = 'dd MMMM yyyy',
  required String tanggal,
}) {
  try {
    final parsedDate = DateTime.parse(tanggal);
    final outputFormat = DateFormat(format, 'id_ID');

    final formattedDate = outputFormat.format(parsedDate);
    return formattedDate;
  } catch (e) {
    return 'Tanggal tidak valid';
  }
}

String shortenText(String text, int longText) {
  if (text.length <= longText) {
    return text;
  } else {
    return '${text.substring(0, longText)}...';
  }
}
