import 'package:stardust/stardust.dart';

class Badge extends Tag {
  Badge({
    Color? backgroundColor,
    super.borderRadius = BorderRadius.pill,
    required super.label,
    super.style = TagStyle.dark,
    super.expanded,
  }) : super(
            backgroundColor: (backgroundColor ?? Colors.primaryPure)
                .withOpacity(style == TagStyle.dark
                    ? 1
                    : style == TagStyle.flat
                        ? 0.15
                        : 0.10));

  @override
  Widget styleLabel(Widget label) => DefaultTextStyle(
        style: TextStyle(
          color: style == TagStyle.dark
              ? Colors.white
              : backgroundColor.withOpacity(1),
          fontSize: FontSize.xxs,
          height: LineHeight.md,
          fontWeight: FontWeight.medium,
        ),
        textAlign: TextAlign.center,
        softWrap: false,
        overflow: TextOverflow.fade,
        child: label,
      );

  @override
  Border getBorder() => Border(
      width: style == TagStyle.light ? BorderWidth.hairline : BorderWidth.none,
      color: style == TagStyle.dark
          ? backgroundColor
          : style == TagStyle.flat
              ? backgroundColor
              : backgroundColor.withOpacity(1));
}
