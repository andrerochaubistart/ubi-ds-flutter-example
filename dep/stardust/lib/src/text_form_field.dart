import 'package:flutter/material.dart' as mt;
import 'package:flutter/services.dart';

import '../stardust.dart';
import 'input_base.dart';

class TextFormField extends StatelessWidget with InputBase {
  mt.InputDecoration? decoration;
  mt.TextEditingController? controller;
  String? Function(String? value)? validator;
  void Function()? onEditingComplete;
  mt.TextInputType? keyboardType;
  bool obscureText;
  bool enableSuggestions;
  bool autocorrect;
  FocusNode focusNode = FocusNode();
  bool readOnly;
  List<TextInputFormatter>? inputFormatters;
  ValueChanged<String>? onChanged;
  String? initialValue;
  int? maxLines;
  int? minLines;
  TextStyle? style;
  int? maxLength;
  MaxLengthEnforcement? maxLengthEnforcement;
  AutovalidateMode? autovalidateMode;
  TextCapitalization textCapitalization;
  TapRegionCallback? onTapOutside;

  TextFormField({
    super.key,
    this.decoration,
    this.controller,
    this.validator,
    this.onEditingComplete,
    this.keyboardType,
    this.obscureText = false,
    this.enableSuggestions = false,
    this.autocorrect = false,
    this.readOnly = false,
    this.inputFormatters,
    this.onChanged,
    this.initialValue,
    FocusNode? focusNode,
    this.maxLines,
    this.minLines,
    this.style,
    this.maxLength,
    this.maxLengthEnforcement,
    this.autovalidateMode,
    this.textCapitalization = TextCapitalization.sentences,
    this.onTapOutside,
  }) {
    if (focusNode != null) this.focusNode = focusNode;
  }

  @override
  Widget build(mt.BuildContext context) {
    mt.ThemeData theme = Theme.of(context);
    bool expands = (maxLines == null && minLines == null) ? true : false;
    Widget textField = mt.TextFormField(
      key: key,
      expands: expands,
      decoration: ajustDecorationFormField(decoration, theme),
      controller: controller,
      validator: (val) => _validator(val, context),
      //autovalidateMode: AutovalidateMode.onUserInteraction,
      onEditingComplete:
          onEditingComplete ?? FocusManager.instance.primaryFocus?.nextFocus,
      // onFieldSubmitted: (_) => onEditingComplete != null
      //     ? onEditingComplete!()
      //     : FocusManager.instance.primaryFocus?.nextFocus(),
      keyboardType: keyboardType,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      autovalidateMode: autovalidateMode,
      focusNode: focusNode,
      readOnly: readOnly,
      enabled: !readOnly,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      initialValue: initialValue,
      maxLines: maxLines,
      minLines: minLines,
      style: style,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      textCapitalization: textCapitalization,
      onTapOutside: onTapOutside,
    );

    return buildStyledFormField(textField, expands, decoration, theme);
  }

  String? _validator(String? value, mt.BuildContext context) {
    if (validator == null) return null;
    var result = validator!(value);
    if (result != null) FocusScope.of(context).requestFocus(focusNode);
    return result;
  }
}
