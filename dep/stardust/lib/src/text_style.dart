import 'package:flutter/material.dart' as mt;
import 'package:stardust/stardust.dart';

class TextStyle extends mt.TextStyle {
  TextStyle({
    super.inherit = true,
    super.color,
    super.backgroundColor,
    FontSize? fontSize,
    FontWeight? fontWeight,
    super.fontStyle,
    super.letterSpacing,
    super.wordSpacing,
    super.textBaseline,
    LineHeight? height,
    super.leadingDistribution,
    super.locale,
    super.foreground,
    super.background,
    super.shadows,
    super.fontFeatures,
    super.fontVariations,
    super.decoration,
    super.decorationColor,
    super.decorationStyle,
    super.decorationThickness,
    super.debugLabel,
    super.fontFamily,
    super.fontFamilyFallback,
    super.package,
    super.overflow,
  }) : super(
            fontSize: fontSize?.value,
            fontWeight: fontWeight,
            height: height?.value);
}
