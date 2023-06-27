import 'package:flutter/material.dart' as mt;
import 'package:stardust/stardust.dart';

abstract class _ButtonBase extends StatelessWidget {
  VoidCallback? onPressed;
  Widget child;
  Widget? iconLeft;
  Widget? iconRight;
  Color? backgroundColor;
  BorderRadius borderRadius;
  FixedHeight fixedHeight;

  _ButtonBase({
    required this.child,
    required this.onPressed,
    this.iconLeft,
    this.iconRight,
    this.backgroundColor,
    required this.borderRadius,
    this.fixedHeight = FixedHeight.lg,
  });

  Widget buildChild() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
        padding: EdgeInsets.only(left: Spacing.xxxs.value),
        child: iconLeft,
      ),
      Padding(
        padding: EdgeInsets.only(
          left: Spacing.nano.value,
          right: Spacing.nano.value,
        ),
        child: child,
      ),
      Padding(
        padding: EdgeInsets.only(right: Spacing.xxxs.value),
        child: iconRight,
      ),
    ]);
  }

  ButtonStyle getStyle(mt.ThemeData theme, ButtonStyle styleFrom) {
    var styleButton = styleFrom.copyWith(
      padding: const MaterialStatePropertyAll(EdgeInsets.zero),
      fixedSize: MaterialStatePropertyAll(Size.fromHeight(fixedHeight.value)),
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
        borderRadius: borderRadius,
      )),
    );
    styleButton = theme.elevatedButtonTheme.style == null
        ? styleButton
        : theme.elevatedButtonTheme.style!.merge(styleButton);
    return styleButton;
  }
}

class LinkButton extends _ButtonBase {
  LinkButton({
    required String label,
    required super.onPressed,
    String fontFamily = 'font-family-poppins-bold',
    Color? textColor = Colors.neutral1,
    LineHeight lineHeight = LineHeight.default_,
    FontSize fontSize = FontSize.xxs,
  }) : super(
      borderRadius: BorderRadius.none,
      child: Text(
        label,
        style: TextStyle(
            decoration: TextDecoration.underline,
            height: lineHeight,
            fontFamily: fontFamily,
            fontSize: fontSize,
            color: textColor),
      ));

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: child);
  }
}

class PrimaryButton extends _ButtonBase {
  PrimaryButton({
    required String label,
    required super.onPressed,
    super.iconLeft,
    super.iconRight,
    super.backgroundColor,
    String fontFamily = 'font-family-poppins-bold',
    Color? textColor = Colors.white,
    LineHeight lineHeight = LineHeight.default_,
    FontSize fontSize = FontSize.xxs,
    super.borderRadius = BorderRadius.sm,
    super.fixedHeight,
  }) : super(
      child: Text(
        label,
        style: TextStyle(
            height: lineHeight,
            fontFamily: fontFamily,
            fontSize: fontSize,
            color: textColor),
      ));

  @override
  Widget build(BuildContext context) {
    var theme = mt.Theme.of(context);
    backgroundColor ??= theme.colorScheme.primary;
    var iconTheme = theme.iconTheme.copyWith(
        size: Spacing.xxxs.value,
        color: Colors.white
    );

    if (iconLeft is Icon) {
      iconLeft = IconTheme(data: iconTheme, child: iconLeft!);
    }
    if (iconRight is Icon) {
      iconRight = IconTheme(data: iconTheme, child: iconRight!);
    }

    return ElevatedButton(
        onPressed: onPressed,
        child: buildChild(),
        style: getStyle(
            theme,
            ElevatedButton.styleFrom(
              disabledBackgroundColor: backgroundColor?.withAlpha(50),
              disabledForegroundColor: backgroundColor,
              backgroundColor: backgroundColor,
            )));
  }
}

class SecundaryButton extends _ButtonBase {
  BorderWidth borderWidth;
  Color borderColor;

  SecundaryButton({
    required String label,
    required super.onPressed,
    super.iconLeft,
    super.iconRight,
    super.borderRadius = BorderRadius.sm,
    super.backgroundColor = Colors.none,
    String fontFamily = 'font-family-poppins-bold',
    FontSize fontSize = FontSize.xxs,
    Color textColor = Colors.black,
    this.borderColor = Colors.black,
    this.borderWidth = BorderWidth.thin,
    super.fixedHeight,
    LineHeight lineHeight = LineHeight.default_,
  }) : super(
      child: Text(
        label,
        style: TextStyle(
            height: lineHeight,
            fontFamily: fontFamily,
            fontSize: fontSize,
            color: onPressed != null ? textColor : textColor.withAlpha(75)),
      ));

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    backgroundColor ??= theme.colorScheme.primary;

    return OutlinedButton(
      onPressed: onPressed,
      child: buildChild(),
      style: getStyle(
          theme,
          OutlinedButton.styleFrom(
            disabledBackgroundColor: backgroundColor,
            disabledForegroundColor: borderColor.withAlpha(50),
            foregroundColor: Colors.black,
            backgroundColor: backgroundColor,
            side: BorderSide(
                color:
                onPressed != null ? borderColor : borderColor.withAlpha(50),
                width: borderWidth.value),
          )),
    );
  }
}
