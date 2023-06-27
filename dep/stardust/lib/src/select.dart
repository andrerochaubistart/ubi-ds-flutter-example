import 'dart:async';

import 'package:flutter/material.dart' as mt;
import 'package:stardust/src/input_base.dart';

import '../stardust.dart';

typedef BuilderOptionItem<T> = Widget Function(T value, bool checked);
typedef SelectConfirmAction = void Function(List<SelectOption> options);
typedef FilterOptions<T> = bool Function(SelectOption<T> option, String search);

class Select<T> extends FormField<List<SelectOption<T>>> {
  BuilderOptionItem<T> builderOptionItem;
  BuilderOptionItem<T>? builderSelectedOptionItem;
  String hintSearchText;
  String confirmLabelButton;
  List<SelectOption<T>> options;
  bool multiples;
  Widget? title;
  InputDecoration decoration;

  Select({
    this.builderSelectedOptionItem,
    required this.builderOptionItem,
    required ValueChanged<T> onChange,
    required this.options,
    this.decoration = const InputDecoration(),
    this.hintSearchText = 'Find',
    this.confirmLabelButton = 'Confirm selection',
    this.multiples = false,
    this.title,
    FilterOptions? filter,
  }) : super(builder: (field) {
          var theme = Theme.of(field.context);
          Widget? label = decoration.label ??
              (decoration.labelText != null
                  ? Text(decoration.labelText!)
                  : null);
          var contentKey = GlobalKey<_SelectedOptionsViewerState<T>>();
          var contentInput = _SelectedOptionsViewer<T>(
            key: contentKey,
            options: options,
            placeholder: decoration.hintText,
            builderOptionItem: builderSelectedOptionItem ?? builderOptionItem,
            multiples: multiples,
          );
          void showOptions() {
            showModalBottomSheet(
              context: field.context,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.xs,
                  side: BorderSide(
                    width: BorderWidth.hairline.value,
                    color: Colors.grey4,
                  )),
              elevation: 2,
              builder: (context) => DraggableScrollableSheet(
                expand: true,
                initialChildSize: 1,
                minChildSize: 1,
                maxChildSize: 1,
                builder: (context, scrollController) => _ListOptionsModal<T>(
                  options,
                  builderOptionItem,
                  (options) =>
                      onChange(options.where((e) => e.checked).first.value),
                  hintSearchText,
                  confirmLabelButton,
                  multiples,
                  title,
                  scrollController,
                  contentKey,
                  filter,
                ),
              ),
            );
          }

          var sufixIcon = IconButton(
              tooltip: hintSearchText,
              onPressed: showOptions,
              padding: EdgeInsets.zero,
              icon: Icon(Icons.chevron_down));
          final effectiveDecoration =
              (multiples ? decoration : ajustDecorationFormField(decoration))
                  .copyWith(
            suffixIcon: sufixIcon,
            floatingLabelBehavior: mt.FloatingLabelBehavior.never,
          );

          return GestureDetector(
            onTap: showOptions,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if (label != null)
                DefaultTextStyle(
                  style: theme.textTheme.labelMedium ??
                      TextStyle(
                          fontSize: FontSize.xxs, fontWeight: FontWeight.bold),
                  child: label,
                ),
              Container(
                constraints: BoxConstraints(
                    minHeight: FixedHeight.lg.value,
                    maxHeight:
                        multiples ? double.infinity : FixedHeight.lg.value),
                child: InputDecorator(
                  decoration: effectiveDecoration,
                  child: contentInput,
                ),
              ),
            ]),
          );
        });
}

class _SelectedOptionsViewer<T> extends StatefulWidget {
  List<SelectOption<T>> options;
  String? placeholder;
  BuilderOptionItem<T> builderOptionItem;
  bool multiples;

  _SelectedOptionsViewer({
    super.key,
    required this.options,
    this.placeholder,
    required this.builderOptionItem,
    required this.multiples,
  });

  @override
  State<_SelectedOptionsViewer<T>> createState() =>
      _SelectedOptionsViewerState<T>();
}

class _SelectedOptionsViewerState<T> extends State<_SelectedOptionsViewer<T>> {
  @override
  Widget build(BuildContext context) {
    var selected = widget.options.where((e) => e.checked);
    if (selected.isEmpty) {
      return Text(
        widget.placeholder ?? '',
        style: TextStyle(
          color: Colors.grey4,
          fontSize: FontSize.xxs,
        ),
      );
    }

    Widget optionsSelected;
    if (!widget.multiples) {
      var option = selected.first;
      optionsSelected = widget.builderOptionItem(option.value, option.checked);
    } else {
      optionsSelected = Wrap(
        spacing: Spacing.quark.value,
        runSpacing: Spacing.quark.value,
        children: [
          for (var option in selected)
            Tag(
              backgroundColor: Colors.grey2,
              borderRadius: BorderRadius.xs,
              label: buildContentItemMultiple(option),
              height: FixedHeight.xs.value,
              iconRight: IconButton(
                icon: Icon(
                  Icons.x_close,
                  color: Colors.grey7,
                ),
                onPressed: () => setState(() {
                  option.checked = false;
                }),
              ),
            ),
        ],
      );
    }

    return Row(children: [
      Expanded(child: optionsSelected),
      IconButton(
        icon: Icon(Icons.x, size: 24, color: Colors.grey4),
        iconSize: 24,
        padding: EdgeInsets.zero,
        onPressed: clear,
      ),
      Container(
        decoration: BoxDecoration(
            border: Border.only(right: BorderSide(color: Colors.grey4))),
        height: 20,
      ),
    ]);
  }

  void clear() {
    setState(() {
      for (var option in widget.options) option.checked = false;
    });
  }

  Widget buildContentItemMultiple(SelectOption<T> option) {
    var content = widget.builderOptionItem(option.value, option.checked);
    return DefaultTextStyle(
        style: TextStyle(color: Colors.grey7), child: content);
  }
}

class SelectOption<T> {
  T value;
  bool checked;

  SelectOption(this.value, this.checked);
}

class _ListOptionsModal<T> extends StatefulWidget {
  BuilderOptionItem<T> buildOption;
  SelectConfirmAction confirmAction;
  String hintSearchText;
  String confirmLabelButton;
  List<SelectOption<T>> options;
  bool multiples;
  Widget? title;
  ScrollController scrollController;
  GlobalKey<_SelectedOptionsViewerState> contentKey;
  FilterOptions? filter;

  _ListOptionsModal(
    this.options,
    this.buildOption,
    this.confirmAction,
    this.hintSearchText,
    this.confirmLabelButton,
    this.multiples,
    this.title,
    this.scrollController,
    this.contentKey,
    this.filter,
  );

  @override
  State<_ListOptionsModal<T>> createState() => _ListOptionsModalState<T>();
}

class _ListOptionsModalState<T> extends State<_ListOptionsModal<T>> {
  late ValueNotifier<Iterable<SelectOption<T>>> filtered;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    filtered = ValueNotifier(widget.options);
  }

  @override
  Widget build(BuildContext context) {
    mt.ThemeData theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Spacing.xxxs.value),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
            child: Container(
          color: theme.brightness == Brightness.light
              ? Colors.black
              : Colors.white,
          width: Spacing.xxs.value,
          height: Spacing.quark.value,
          margin: EdgeInsets.symmetric(vertical: Spacing.nano.value),
        )),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search_sm),
            hintText: widget.hintSearchText,
          ),
          onChanged: filter,
        ),
        if (widget.title != null)
          Padding(
            padding: EdgeInsets.symmetric(vertical: Spacing.nano.value),
            child: DefaultTextStyle(
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey7,
                  fontSize: FontSize.xxs,
                  height: LineHeight.default_),
              child: widget.title!,
            ),
          ),
        Expanded(
            child: ValueListenableBuilder(
          valueListenable: filtered,
          builder: (context, filtered, child) => ListView.builder(
            controller: widget.scrollController,
            itemCount: filtered.length,
            itemBuilder: (context, index) =>
                buildItem(theme, filtered.elementAt(index)),
          ),
        )),
        if (widget.multiples)
          Padding(
            padding: EdgeInsets.symmetric(vertical: Spacing.xxxs.value),
            child: SecundaryButton(
                label: widget.confirmLabelButton, onPressed: confirm),
          )
      ]),
    );
  }

  void checkOption(bool value, SelectOption<T> option) {
    setState(() => option.checked = value);
  }

  void confirm() {
    widget.confirmAction(widget.options);
    Navigator.of(context).pop();
    widget.contentKey.currentState?.setState(() {});
  }

  Widget buildItem(mt.ThemeData theme, SelectOption<T> option) {
    Widget item = DefaultTextStyle(
      style: TextStyle(
        color: option.checked ? Colors.neutral1 : Colors.grey7,
        fontSize: FontSize.xs,
        height: LineHeight.default_,
      ),
      child: widget.buildOption(option.value, option.checked),
    );

    item = Container(
      color: option.checked ? Colors.neutral1.withOpacity(0.10) : null,
      height: FixedHeight.xl.value,
      //margin: EdgeInsets.only(top: Spacing.nano.value),
      padding: EdgeInsets.symmetric(
        vertical: Spacing.xxxs.value,
        horizontal: Spacing.nano.value,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.multiples)
            Checkbox(
              value: option.checked,
              onChanged: (value) => checkOption(value!, option),
            ),
          Expanded(child: item),
          if (!widget.multiples && option.checked)
            Icon(Icons.check_circle2, color: Colors.neutral1)
        ],
      ),
    );

    if (widget.multiples || option.checked) return item;

    return InkWell(
      onTap: () {
        widget.options.forEach((e) => e.checked = false);
        option.checked = true;
        confirm();
      },
      child: item,
    );
  }

  void filter(String search) {
    timer?.cancel();
    timer = Timer(Duration(milliseconds: 500), () {
      var _filter = widget.filter ??
          (opt, search) =>
              opt.value.toString().toLowerCase().contains(search.toLowerCase());
      filtered.value =
          widget.options.where((option) => _filter(option, search));
    });
  }
}
