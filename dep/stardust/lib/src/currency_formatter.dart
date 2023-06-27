import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:stardust/stardust.dart';

Map<String, NumberFormat> _currenciesFormats = {};

NumberFormat getCurrencyFormat(String currency, Locale locale) {
  var finder = '$currency-${locale.toLanguageTag()}';

  var result = _currenciesFormats[finder];
  if (result == null) {
    result =
        NumberFormat.simpleCurrency(locale: locale.toString(), name: currency);
    _currenciesFormats[finder] = result;
  }

  return result;
}

class CurrencyInputFormatter extends TextInputFormatter {
  NumberFormat currencyFormat;

  CurrencyInputFormatter(this.currencyFormat);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var valorFinal = newValue.text;
    var number = double.parse(valorFinal);
    number /= math.pow(10, currencyFormat.decimalDigits ?? 1);
    valorFinal = currencyFormat.format(number);

    var sufix = number.isNegative
        ? currencyFormat.negativeSuffix.length
        : currencyFormat.positiveSuffix.length;

    var offset = valorFinal.length - sufix;

    return TextEditingValue(
      text: valorFinal,
      selection: TextSelection.collapsed(offset: offset),
    );
  }
}
