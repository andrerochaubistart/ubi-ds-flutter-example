import 'package:flutter/material.dart' as mt;

import '../stardust.dart';

mixin InputBase {
  Widget buildStyledFormField(Widget formField, bool expands,
      InputDecoration? decoration, mt.ThemeData? theme) {
    formField = expands
        ? SizedBox(
            height: FixedHeight.lg.value,
            child: formField,
          )
        : formField;

    List<Widget> children = [
      if (decoration?.labelText != null)
        Text(decoration!.labelText!,
            style: decoration.labelStyle ??
                TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: FontSize.xxs,
                    height: LineHeight.default_,
                    color: Colors.grey8)),
      if (decoration?.labelText != null) SizedBox(height: Spacing.nano.value),
      formField,
      if (decoration?.helperText != null) SizedBox(height: Spacing.nano.value),
      if (decoration?.helperText != null)
        Text(decoration!.helperText!,
            style: decoration.helperStyle ??
                theme?.inputDecorationTheme.helperStyle)
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}

InputDecoration ajustDecorationFormField(InputDecoration? decoration,
    [mt.ThemeData? theme]) {
  var iconsConstraint = BoxConstraints(
    minWidth: Spacing.sm.value,
    maxWidth: Spacing.sm.value,
  );
  var iconTheme = (theme?.iconTheme ?? IconThemeData()).copyWith(
    size: FontSize.xxs.value,
    color: Colors.grey8,
  );
  return InputDecoration(
    icon: decoration?.icon,
    iconColor: decoration?.iconColor,
    label: decoration?.label,
    labelText: null,
    //decoration?.labelText,
    labelStyle: decoration?.labelStyle,
    floatingLabelStyle: decoration?.floatingLabelStyle,
    helperText: null,
    helperStyle: decoration?.helperStyle,
    helperMaxLines: decoration?.helperMaxLines,
    hintText: decoration?.hintText,
    hintStyle: decoration?.hintStyle,
    hintTextDirection: decoration?.hintTextDirection,
    hintMaxLines: decoration?.hintMaxLines,
    errorText: decoration?.errorText,
    errorStyle: decoration?.errorStyle,
    errorMaxLines: decoration?.errorMaxLines,
    floatingLabelBehavior: decoration?.floatingLabelBehavior,
    floatingLabelAlignment: decoration?.floatingLabelAlignment,
    isCollapsed: decoration?.isCollapsed == true,
    isDense: decoration?.isDense,
    contentPadding: decoration?.contentPadding ??
        EdgeInsets.only(
          left: decoration?.prefixIcon == null
              ? Spacing.xxxs.value
              : Spacing.nano.value,
          right: decoration?.suffixIcon == null
              ? Spacing.xxxs.value
              : Spacing.nano.value,
        ),
    prefixIcon: decoration?.prefixIcon == null
        ? null
        : IconTheme(
            data: iconTheme,
            child: decoration!.prefixIcon!,
          ),
    prefix: decoration?.prefix,
    prefixText: decoration?.prefixText,
    prefixStyle: decoration?.prefixStyle,
    prefixIconColor: decoration?.prefixIconColor,
    prefixIconConstraints: decoration?.prefixIconConstraints ?? iconsConstraint,
    suffixIcon: decoration?.suffixIcon == null
        ? null
        : IconTheme(
            data: iconTheme,
            child: decoration!.suffixIcon!,
          ),
    suffix: decoration?.suffix,
    suffixText: decoration?.suffixText,
    suffixStyle: decoration?.suffixStyle,
    suffixIconColor: decoration?.suffixIconColor,
    suffixIconConstraints: decoration?.suffixIconConstraints ?? iconsConstraint,
    counter: decoration?.counter,
    counterText: decoration?.counterText,
    counterStyle: decoration?.counterStyle,
    filled: decoration?.filled,
    fillColor: decoration?.fillColor,
    focusColor: decoration?.focusColor,
    hoverColor: decoration?.hoverColor,
    errorBorder: decoration?.errorBorder,
    focusedBorder: decoration?.focusedBorder,
    focusedErrorBorder: decoration?.focusedErrorBorder,
    disabledBorder: decoration?.disabledBorder,
    enabledBorder: decoration?.enabledBorder,
    border: decoration?.border,
    enabled: decoration?.enabled == true,
    semanticCounterText: decoration?.semanticCounterText,
    alignLabelWithHint: decoration?.alignLabelWithHint,
    constraints: decoration?.constraints,
  );
}
