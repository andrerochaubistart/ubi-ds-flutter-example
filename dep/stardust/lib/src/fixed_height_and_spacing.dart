enum FixedHeight {
  nano(16),
  xxs(18),
  xs(24),
  sm(32),
  md(40),
  lg(44),
  xl(56),
  xxl(64),
  xxxl(72),
  giant(96);

  final double value;

  const FixedHeight(this.value);
}

enum Spacing {
  quark(4),
  nano(8),
  xxxs(16),
  xxs(24),
  xs(32),
  sm(40),
  md(48),
  lg(56),
  xl(64),
  xxl(80),
  xxxl(120),
  houge(160),
  giant(200);

  final double value;

  const Spacing(this.value);
}
