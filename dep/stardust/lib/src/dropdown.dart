import 'package:collection/collection.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart' as material;

import '../stardust.dart';
import 'input_base.dart';

class DropdownButtonFormField<T> extends material.StatefulWidget {
  material.InputDecoration? decoration;
  FormFieldValidator<T>? validator;
  List<material.DropdownMenuItem<T>> items;
  DropdownSearchBuilder<T>? dropdownBuilder;
  @Deprecated('Use: dropdownBuilder')
  material.DropdownButtonBuilder? selectedItemBuilder;
  ValueChanged<T?>? onChanged;
  T? value;
  bool Function(T? item, String filter)? filterFn;

  DropdownButtonFormField({
    super.key,
    required this.items,
    required this.onChanged,
    this.decoration,
    this.validator,
    this.value,
    this.selectedItemBuilder,
    this.filterFn,
    this.dropdownBuilder,
  });

  @override
  material.State<DropdownButtonFormField<T>> createState() =>
      _DropdownButtonFormFieldState<T>();
}

class _DropdownButtonFormFieldState<T>
    extends material.State<DropdownButtonFormField<T>> {
  @override
  Widget build(material.BuildContext context) {
    var theme = Theme.of(context);
    InputDecoration id = (widget.decoration ?? InputDecoration()).copyWith(
      isDense: theme.inputDecorationTheme.isDense,
      labelText: widget.decoration?.hintText,
      floatingLabelBehavior: theme.inputDecorationTheme.floatingLabelBehavior,
      fillColor: theme.inputDecorationTheme.fillColor,
      filled: theme.inputDecorationTheme.filled,
      counterStyle: theme.inputDecorationTheme.counterStyle,
      border: theme.inputDecorationTheme.border,
      contentPadding: theme.inputDecorationTheme.contentPadding,
      constraints: theme.inputDecorationTheme.constraints,
    );
    var textField = DropdownSearch<T?>(
      popupProps: PopupPropsMultiSelection.modalBottomSheet(
        //searchFieldProps: TextFieldProps(autofocus: true),
        showSearchBox: widget.filterFn != null,
        itemBuilder: (context, item, isSelected) => material.ListTile(
          title: widget.items.firstWhere((e) => e.value == item).child,
        ),
      ),
      items: widget.items.map((e) => e.value).toList(),
      dropdownDecoratorProps: DropDownDecoratorProps(
        baseStyle: id.labelStyle,
        dropdownSearchDecoration: ajustDecorationFormField(id, theme),
      ),
      dropdownBuilder:
          widget.value == null && widget.decoration?.hintText != null
              ? null
              : _dropDownBuilder,
      onChanged: (v) => setState(() {
        if (widget.onChanged != null) widget.onChanged!(widget.value = v);
      }),
      validator: widget.validator,
      selectedItem: widget.value,
      filterFn: widget.filterFn,
    );

    if (widget.decoration?.labelText != null) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: Spacing.nano.value),
        Text(widget.decoration!.labelText!,
            style: id?.labelStyle ??
                TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: FontSize.xxs,
                    height: LineHeight.default_,
                    color: Colors.grey8)),
        SizedBox(height: Spacing.nano.value),
        textField
      ]);
    }
    return textField;
  }

  Widget _dropDownBuilder(c, item) {
    if (widget.dropdownBuilder != null) return widget.dropdownBuilder!(c, item);
    if (widget.selectedItemBuilder != null && item != null)
      return widget.selectedItemBuilder!(c)
          .elementAt(widget.items.indexWhere((e) => e.value == item));
    var r = widget.items.firstWhereOrNull((e) => e.value == item);
    if (r != null) return r.child;
    return Container();
  }
}
