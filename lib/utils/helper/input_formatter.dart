import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Check if the new value starts with a space
    if (newValue.text.startsWith(' ')) {
      // Return the old value to prevent the space from being added
      return oldValue;
    }
    return newValue;
  }
}

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Convert the new value to lowercase
    final String lowerCasedText = newValue.text.toLowerCase();

    return newValue.copyWith(
      text: lowerCasedText,
      selection: newValue.selection,
    );
  }
}
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Convert the new value to lowercase
    final String lowerCasedText = newValue.text.toUpperCase();

    return newValue.copyWith(
      text: lowerCasedText,
      selection: newValue.selection,
    );
  }
}

class RupiahFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    // Format the input as a currency value with Rupiah.
    final formattedText = NumberFormat.currency(
      symbol: 'Rp ',
      locale: 'id_ID',
      decimalDigits: 0,
    ).format(double.tryParse(text));

    if (formattedText.length > 17) {
      return oldValue;
    } else {
      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    }
  }
}

class NumberTextInputFormatterWithMax extends TextInputFormatter {
  final num maxValue;

  NumberTextInputFormatterWithMax(this.maxValue);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    // Format the input as a currency value with Rupiah.
    final formattedText = NumberFormat.currency(
      symbol: 'Rp ',
      locale: 'id_ID',
      decimalDigits: 0,
    ).format(double.tryParse(text) ?? 0);

    final numericValue =
        double.tryParse(text.replaceAll(RegExp('[^0-9]'), '')) ?? 0;

    // Check if the numeric value exceeds the maximum value
    if (numericValue > maxValue) {
      // If yes, set the text field value to the maximum value
      return TextEditingValue(
        text: NumberFormat.currency(
          symbol: 'Rp ',
          locale: 'id_ID',
          decimalDigits: 0,
        ).format(maxValue),
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    }

    if (formattedText.length > 20) {
      return oldValue;
    } else {
      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    }
  }
}
