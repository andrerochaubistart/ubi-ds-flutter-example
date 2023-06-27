import 'package:flutter/widgets.dart';

class Spacing extends EdgeInsets {
  static Spacing quark = Spacing.all(4);
  static Spacing nano = Spacing.all(8);
  static Spacing xxxs = Spacing.all(16);
  static Spacing xxs = Spacing.all(24);
  static Spacing xs = Spacing.all(32);
  static Spacing sm = Spacing.all(40);
  static Spacing md = Spacing.all(48);
  static Spacing lg = Spacing.all(56);
  static Spacing xl = Spacing.all(64);
  static Spacing xxl = Spacing.all(80);
  static Spacing xxxl = Spacing.all(120);
  static Spacing houge = Spacing.all(160);
  static Spacing giant = Spacing.all(200);

  Spacing.all(super.value) : super.all();

  Spacing.fromLTRB(super.left, super.top, super.right, super.bottom)
      : super.fromLTRB();
}
