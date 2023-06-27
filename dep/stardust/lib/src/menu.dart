import 'package:flutter/material.dart' as mt;
import 'package:stardust/stardust.dart';

class Menu extends StatefulWidget {
  Widget title;
  IconData? icon;
  List<Widget>? children;
  VoidCallback? onTap;
  Spacing childrenPaddingLeft;
  Color? backgroundColor;
  BorderRadius borderRadius;
  EdgeInsets padding;

  Menu({
    required this.title,
    this.icon,
    this.children,
    this.onTap,
    this.childrenPaddingLeft = Spacing.xxxs,
    this.backgroundColor,
    this.borderRadius = BorderRadius.xs,
    EdgeInsets? padding,
  })  : assert(
            (onTap != null || children != null) &&
                !(onTap != null && children != null),
            'Only onTap or items can be non-null, both cannot at the same time'),
        padding = EdgeInsets.symmetric(horizontal: Spacing.xxxs.value);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeOutTween =
      CurveTween(curve: Curves.easeOut);
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  final ShapeBorderTween _borderTween = ShapeBorderTween();
  final ColorTween _headerColorTween = ColorTween();
  final ColorTween _iconColorTween = ColorTween();
  final ColorTween _backgroundColorTween = ColorTween();

  late AnimationController _animationController;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;
  late Animation<Color?> _headerColor;
  late Animation<Color?> _iconColor;

  bool _isExpanded = false;

  get fontColor => (widget.backgroundColor == null ||
          widget.backgroundColor!.computeLuminance() > 0.179)
      ? Colors.grey8
      : Colors.white;

  get childrenPadding => widget.childrenPaddingLeft.value + Spacing.nano.value;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    _heightFactor = _animationController.drive(_easeInTween);
    _iconTurns = _animationController.drive(_halfTween.chain(_easeInTween));
    _headerColor =
        _animationController.drive(_headerColorTween.chain(_easeInTween));
    _iconColor =
        _animationController.drive(_iconColorTween.chain(_easeInTween));

    _isExpanded = false;
    if (_isExpanded) {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse().then<void>((void value) {
          if (!mounted) {
            return;
          }
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.maybeOf(context)?.writeState(context, _isExpanded);
    });
  }

  void _handleTap() {
    _toggleExpansion();
  }

  // Platform or null affinity defaults to trailing.
  ListTileControlAffinity _effectiveAffinity(
      ListTileControlAffinity? affinity) {
    switch (affinity ?? ListTileControlAffinity.trailing) {
      case ListTileControlAffinity.leading:
        return ListTileControlAffinity.leading;
      case ListTileControlAffinity.trailing:
      case ListTileControlAffinity.platform:
        return ListTileControlAffinity.trailing;
    }
  }

  Widget _buildIcon(BuildContext context, mt.IconThemeData iconThemeData) {
    return RotationTransition(
      turns: _iconTurns,
      child: IconTheme(
        data: iconThemeData,
        child: Icon(Icons.chevron_down),
      ),
    );
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    final ExpansionTileThemeData expansionTileTheme =
        ExpansionTileTheme.of(context);
    final Clip clipBehavior = Clip.none;
    var iconThemeData = Theme.of(context).iconTheme.copyWith(
          color: fontColor,
          size: Spacing.xxxs.value,
        );
    return Container(
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: widget.borderRadius,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTileTheme.merge(
            iconColor: _iconColor.value ?? expansionTileTheme.iconColor,
            textColor: _headerColor.value,
            child: InkWell(
              onTap: widget.onTap ?? _handleTap,
              child: Container(
                height: FixedHeight.lg.value,
                padding: widget.padding,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.icon != null)
                      Padding(
                          padding: EdgeInsets.only(right: Spacing.nano.value),
                          child: IconTheme(
                            data: iconThemeData,
                            child: Icon(widget.icon),
                          )),
                    Expanded(
                        child: DefaultTextStyle(
                      style: TextStyle(
                        color: fontColor,
                        fontSize: FontSize.xxs,
                        height: LineHeight.default_,
                        fontWeight: FontWeight.medium,
                      ),
                      textAlign: TextAlign.start,
                      softWrap: false,
                      overflow: TextOverflow.fade,
                      child: widget.title,
                    )),
                    if (widget.children != null)
                      _buildIcon(context, iconThemeData),
                  ],
                ),
              ),
            ),
          ),
          ClipRect(
            child: Align(
              alignment: Alignment.center,
              heightFactor: _heightFactor.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    mt.ThemeData theme = mt.Theme.of(context);
    final ExpansionTileThemeData expansionTileTheme =
        ExpansionTileTheme.of(context);
    final ExpansionTileThemeData defaults = expansionTileTheme;
    _borderTween
      ..begin = expansionTileTheme.collapsedShape ??
          Border.only(
            top: BorderSide(color: Colors.transparent),
            bottom: BorderSide(color: Colors.transparent),
          )
      ..end = expansionTileTheme.collapsedShape ??
          Border.only(
            top: BorderSide(color: theme.dividerColor),
            bottom: BorderSide(color: theme.dividerColor),
          );
    _headerColorTween
      ..begin =
          expansionTileTheme.collapsedTextColor ?? defaults.collapsedTextColor
      ..end = expansionTileTheme.textColor ?? defaults.textColor;
    _iconColorTween
      ..begin =
          expansionTileTheme.collapsedIconColor ?? defaults.collapsedIconColor
      ..end = expansionTileTheme.iconColor ?? defaults.iconColor;
    _backgroundColorTween
      ..begin = expansionTileTheme.collapsedBackgroundColor
      ..end = expansionTileTheme.backgroundColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _animationController.isDismissed;
    final bool shouldRemoveChildren = closed;

    final Widget result = Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: Container(
          padding:
              EdgeInsets.only(left: childrenPadding, right: Spacing.xxxs.value),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.children?.map((e) {
                  if (e is Menu) {
                    e.backgroundColor = widget.backgroundColor;
                    e.padding = EdgeInsets.zero;
                  } else {
                    e = DefaultTextStyle(
                      style: TextStyle(
                        color: fontColor,
                        fontSize: FontSize.xxs,
                        height: LineHeight.default_,
                        fontWeight: FontWeight.medium,
                      ),
                      textAlign: TextAlign.start,
                      softWrap: false,
                      overflow: TextOverflow.fade,
                      child: e,
                    );
                  }
                  return e;
                }).toList() ??
                [],
          ),
        ),
      ),
    );

    return AnimatedBuilder(
      animation: _animationController.view,
      builder: _buildChildren,
      child: shouldRemoveChildren ? null : result,
    );
  }
}
