import 'package:datetime_picker_field_platform/datetime_picker_field_platform.dart';
import 'package:flutter/material.dart' as mt;
import 'package:stardust/stardust.dart';

export 'package:datetime_picker_field_platform/datetime_picker_field_platform.dart'
    show DateMode;

class DateTimeFormField extends StatelessWidget {
  mt.InputDecoration? decoration;
  DateTime maximumDate;
  DateTime minimumDate;
  mt.FormFieldValidator<String>? validator;
  DateMode mode;
  String? dateFormatter;
  ValueSetter<DateTime>? onChange;
  DateTime? initialDate;
  String title;
  String textCancel;
  String textConfirm;

  DateTimeFormField({
    DateTime? minimumDate,
    DateTime? maximumDate,
    this.decoration,
    this.validator,
    this.mode = DateMode.date,
    this.dateFormatter = 'dd/MM/yyyy',
    this.onChange,
    this.initialDate,
    this.title = "Select",
    this.textCancel = "Cancel",
    this.textConfirm = "Confirm",
  })
      : minimumDate = minimumDate ?? DateTime(1900),
        maximumDate = maximumDate ?? DateTime(DateTime
            .now()
            .year + 1000);

  @override
  mt.Widget build(mt.BuildContext context) {
    Widget formField = DateTimeFieldPlatform(
      decoration: decoration,
      initialDate: initialDate,
      validator: validator,
      mode: mode,
      maximumDate: (initialDate?.isAfter(maximumDate) ?? false)
          ? initialDate!
          : maximumDate,
      minimumDate: (initialDate?.isBefore(minimumDate) ?? false)
          ? initialDate!
          : minimumDate,
      dateFormatter: dateFormatter,
      onConfirm: (dateTime) {
        onChange?.call(dateTime);
        initialDate = dateTime;
      },
      title: title,
      textCancel: textCancel,
      textConfirm: textConfirm,
    );

    formField = SizedBox(
      height: FixedHeight.lg.value,
      child: formField,
    );

    if (decoration?.labelText != null) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: Spacing.nano.value),
        Text(decoration!.labelText!,
            style: decoration?.labelStyle ??
                TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: FontSize.xxs,
                    height: LineHeight.default_,
                    color: Colors.grey8)),
        SizedBox(height: Spacing.nano.value),
        formField
      ]);
    }
    return formField;
  }
}
