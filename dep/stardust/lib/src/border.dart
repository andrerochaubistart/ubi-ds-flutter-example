import 'package:flutter/material.dart' as mt;

import '../stardust.dart';

class Border extends mt.Border {
  Border.fromBorderSide(BorderSide side) : super.fromBorderSide(side);

  Border.only({
    super.top,
    super.right,
    super.bottom,
    super.left,
  }) : super();

  factory Border({
    Color color = const Color(0xFF000000),
    BorderWidth width = BorderWidth.hairline,
    BorderStyle style = BorderStyle.solid,
    double strokeAlign = BorderSide.strokeAlignInside,
  }) {
    final BorderSide side = BorderSide(
        color: color,
        width: width.value,
        style: width == BorderWidth.none ? BorderStyle.none : style,
        strokeAlign: strokeAlign);
    return Border.fromBorderSide(side);
  }
}

enum BorderWidth {
  none(0),
  hairline(1),
  thin(2),
  thick(4),
  heavy(8);

  const BorderWidth(this.value);

  final double value;
}
