import 'package:flutter/material.dart' as mt;

class FontWeight implements mt.FontWeight {
  final int _index;
  final int _value;

  const FontWeight(this._index, this._value);

  @override
  int get index => _index;

  @override
  int get value => _value;

  static const thin = FontWeight(0, 100);
  static const extraLight = FontWeight(1, 200);
  static const light = FontWeight(2, 300);
  static const regular = FontWeight(3, 400);
  static const medium = FontWeight(4, 500);
  static const semibold = FontWeight(5, 600);
  static const bold = FontWeight(6, 700);
  static const extraBold = FontWeight(7, 800);
  static const black = FontWeight(8, 900);
}

enum FontSize {
  xxxs(12),
  xxs(14),
  xs(16),
  sm(18),
  md(20),
  lg(24),
  xl(32),
  xxl(40),
  xxxl(48),
  display(64),
  giant(80);

  const FontSize(this.value);

  final double value;
}

/// Values in percents
enum LineHeight {
  default_(100),
  sm(115),
  md(125),
  lg(150),
  xl(170),
  xxl(200);

  const LineHeight(int value) : value = value / 100.0;

  final double value;
}
