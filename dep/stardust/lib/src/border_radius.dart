import 'package:flutter/material.dart' as mt;

class BorderRadius extends mt.BorderRadius {
  static const none = BorderRadius.only();

  static const xs = BorderRadius.all(mt.Radius.circular(4));
  static const sm = BorderRadius.all(mt.Radius.circular(8));
  static const md = BorderRadius.all(mt.Radius.circular(16));
  static const lg = BorderRadius.all(mt.Radius.circular(24));
  static const pill = BorderRadius.all(mt.Radius.circular(500));

  BorderRadius.circular(super.radius) : super.circular();

  const BorderRadius.all(super.radius) : super.all();

  const BorderRadius.only({
    super.topLeft,
    super.topRight,
    super.bottomLeft,
    super.bottomRight,
  }) : super.only();
}
