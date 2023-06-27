import 'package:stardust/stardust.dart';

enum TagStyle {
  dark,
  flat,
  light,
}

class Tag extends StatelessWidget {
  Color backgroundColor;
  BorderRadius borderRadius;
  Widget label;
  Widget? iconLeft;
  Widget? iconRight;
  TagStyle style;
  bool expanded;
  double height;

  Tag({
    Color? backgroundColor,
    this.borderRadius = BorderRadius.xs,
    required this.label,
    this.iconLeft,
    this.iconRight,
    this.style = TagStyle.dark,
    this.expanded = false,
    double? height,
  })  : backgroundColor = backgroundColor ??
            (style == TagStyle.dark
                ? Colors.primaryPure
                : style == TagStyle.flat
                    ? Colors.grey2
                    : Colors.white),
        height = height ?? FixedHeight.sm.value;

  @override
  Widget build(BuildContext context) {
    if (expanded) label = Expanded(child: label);
    if (iconRight != null || iconLeft != null) {
      var theme = Theme.of(context);
      var iconTheme = theme.iconTheme.copyWith(
        size: Spacing.xxxs.value,
        color: style == TagStyle.dark
            ? Colors.white.withOpacity(0.5)
            : Colors.grey5,
      );
      var iconButtonTheme = IconButtonThemeData(
          style: ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.zero),
        iconSize: MaterialStatePropertyAll(iconTheme.size),
        iconColor: MaterialStatePropertyAll(iconTheme.color),
      ));

      if (iconLeft is Icon) {
        iconLeft = IconTheme(data: iconTheme, child: iconLeft!);
      }
      if (iconRight is Icon) {
        iconRight = IconTheme(data: iconTheme, child: iconRight!);
      }
      if (iconRight is IconButton) {
        iconRight = IconButtonTheme(data: iconButtonTheme, child: iconRight!);
      }
      if (iconLeft is IconButton) {
        iconLeft = IconButtonTheme(data: iconButtonTheme, child: iconLeft!);
      }
    }
    return Container(
      width: expanded ? double.infinity : null,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: getBorder(),
        borderRadius: borderRadius,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: (iconLeft != null || iconRight != null)
              ? Spacing.nano.value
              : Spacing.xxxs.value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconLeft != null)
            Container(
              width: Spacing.xxs.value,
              height: Spacing.xxs.value,
              margin: EdgeInsets.only(right: Spacing.quark.value),
              child: iconLeft,
            ),
          styleLabel(label),
          if (iconRight != null)
            Container(
              width: Spacing.xxs.value,
              height: Spacing.xxs.value,
              margin: EdgeInsets.only(left: Spacing.quark.value),
              child: iconRight,
            ),
        ],
      ),
    );
  }

  Border getBorder() => Border(
      width: BorderWidth.hairline,
      color: style == TagStyle.dark
          ? backgroundColor
          : style == TagStyle.flat
              ? Colors.grey2
              : Colors.grey5);

  Widget styleLabel(Widget label) => DefaultTextStyle(
        style: TextStyle(
          color: style == TagStyle.dark ? Colors.white : Colors.grey5,
          fontSize: FontSize.xxs,
          height: LineHeight.md,
          fontWeight: FontWeight.medium,
        ),
        textAlign: TextAlign.center,
        softWrap: false,
        overflow: TextOverflow.fade,
        child: label,
      );
}
