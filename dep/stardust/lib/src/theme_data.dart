import 'package:flutter/cupertino.dart' as cpt;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as mt;

import '../stardust.dart';

class ThemeData extends mt.ThemeData {
  factory ThemeData.light({
    required ColorScheme colorScheme,
    TextTheme? textTheme,
  }) =>
      ThemeData(
          brightness: Brightness.light,
          colorScheme: colorScheme,
          textTheme: textTheme,
          useMaterial3: true,
          checkboxTheme: CheckboxThemeData(
              fillColor: MaterialStatePropertyAll(colorScheme.primary),
              side: BorderSide(color: Colors.black)),
          radioTheme: RadioThemeData(
              fillColor: MaterialStatePropertyAll(colorScheme.primary),
              overlayColor: MaterialStatePropertyAll(colorScheme.primary)));

  factory ThemeData.dark({
    required ColorScheme colorScheme,
    TextTheme? textTheme,
  }) =>
      ThemeData(
        brightness: Brightness.dark,
        colorScheme: colorScheme,
        textTheme: textTheme,
        useMaterial3: true,
      );

  factory ThemeData({
    bool? applyElevationOverlayColor,
    cpt.NoDefaultCupertinoThemeData? cupertinoOverrideTheme,
    Iterable<ThemeExtension<dynamic>>? extensions,
    InputDecorationTheme? inputDecorationTheme,
    MaterialTapTargetSize? materialTapTargetSize,
    PageTransitionsTheme? pageTransitionsTheme,
    TargetPlatform? platform,
    ScrollbarThemeData? scrollbarTheme,
    InteractiveInkFeatureFactory? splashFactory,
    bool? useMaterial3,
    VisualDensity? visualDensity,
    // COLOR
    // [colorScheme] is the preferred way to configure colors. The other color
    // properties (as well as primaryColorBrightness, and primarySwatch)
    // will gradually be phased out, see https://github.com/flutter/flutter/issues/91772.
    Brightness? brightness,
    Color? canvasColor,
    Color? cardColor,
    required ColorScheme colorScheme,
    Color? colorSchemeSeed,
    Color? dialogBackgroundColor,
    Color? disabledColor,
    Color? dividerColor,
    Color? focusColor,
    Color? highlightColor,
    Color? hintColor,
    Color? hoverColor,
    Color? indicatorColor,
    Color? primaryColor,
    Color? primaryColorDark,
    Color? primaryColorLight,
    MaterialColor? primarySwatch,
    Color? scaffoldBackgroundColor,
    Color? secondaryHeaderColor,
    Color? shadowColor,
    Color? splashColor,
    Color? unselectedWidgetColor,
    // TYPOGRAPHY & ICONOGRAPHY
    String? fontFamily = 'Poppins',
    List<String>? fontFamilyFallback,
    String? package,
    IconThemeData? iconTheme,
    IconThemeData? primaryIconTheme,
    TextTheme? primaryTextTheme,
    TextTheme? textTheme,
    Typography? typography,
    // COMPONENT THEMES
    ActionIconThemeData? actionIconTheme,
    AppBarTheme? appBarTheme,
    BadgeThemeData? badgeTheme,
    MaterialBannerThemeData? bannerTheme,
    BottomAppBarTheme? bottomAppBarTheme,
    BottomNavigationBarThemeData? bottomNavigationBarTheme,
    BottomSheetThemeData? bottomSheetTheme,
    ButtonBarThemeData? buttonBarTheme,
    ButtonThemeData? buttonTheme,
    CardTheme? cardTheme,
    CheckboxThemeData? checkboxTheme,
    ChipThemeData? chipTheme,
    DataTableThemeData? dataTableTheme,
    DatePickerThemeData? datePickerTheme,
    DialogTheme? dialogTheme,
    DividerThemeData? dividerTheme,
    DrawerThemeData? drawerTheme,
    DropdownMenuThemeData? dropdownMenuTheme,
    ElevatedButtonThemeData? elevatedButtonTheme,
    ExpansionTileThemeData? expansionTileTheme,
    FilledButtonThemeData? filledButtonTheme,
    FloatingActionButtonThemeData? floatingActionButtonTheme,
    IconButtonThemeData? iconButtonTheme,
    ListTileThemeData? listTileTheme,
    MenuBarThemeData? menuBarTheme,
    MenuButtonThemeData? menuButtonTheme,
    MenuThemeData? menuTheme,
    NavigationBarThemeData? navigationBarTheme,
    NavigationDrawerThemeData? navigationDrawerTheme,
    NavigationRailThemeData? navigationRailTheme,
    OutlinedButtonThemeData? outlinedButtonTheme,
    PopupMenuThemeData? popupMenuTheme,
    ProgressIndicatorThemeData? progressIndicatorTheme,
    RadioThemeData? radioTheme,
    SearchBarThemeData? searchBarTheme,
    SearchViewThemeData? searchViewTheme,
    SegmentedButtonThemeData? segmentedButtonTheme,
    SliderThemeData? sliderTheme,
    SnackBarThemeData? snackBarTheme,
    SwitchThemeData? switchTheme,
    TabBarTheme? tabBarTheme,
    TextButtonThemeData? textButtonTheme,
    TextSelectionThemeData? textSelectionTheme,
    TimePickerThemeData? timePickerTheme,
    ToggleButtonsThemeData? toggleButtonsTheme,
    TooltipThemeData? tooltipTheme,
    // DEPRECATED (newest deprecations at the bottom)
    @Deprecated(
      'This "fix" is now enabled by default. '
      'This feature was deprecated after v2.5.0-1.0.pre.',
    )
    bool? fixTextFieldOutlineLabel,
    @Deprecated(
      'No longer used by the framework, please remove any reference to it. '
      'This feature was deprecated after v2.6.0-11.0.pre.',
    )
    Brightness? primaryColorBrightness,
    @Deprecated(
        'Use ThemeData.useMaterial3 or override ScrollBehavior.buildOverscrollIndicator. '
        'This feature was deprecated after v2.13.0-0.0.pre.')
    AndroidOverscrollIndicator? androidOverscrollIndicator,
    @Deprecated(
      'No longer used by the framework, please remove any reference to it. '
      'For more information, consult the migration guide at '
      'https://flutter.dev/docs/release/breaking-changes/toggleable-active-color#migration-guide. '
      'This feature was deprecated after v3.4.0-19.0.pre.',
    )
    Color? toggleableActiveColor,
    @Deprecated(
      'No longer used by the framework, please remove any reference to it. '
      'This feature was deprecated after v3.1.0-0.0.pre.',
    )
    Color? selectedRowColor,
    @Deprecated(
      'Use colorScheme.error instead. '
      'This feature was deprecated after v3.3.0-0.5.pre.',
    )
    Color? errorColor,
    @Deprecated(
      'Use colorScheme.background instead. '
      'This feature was deprecated after v3.3.0-0.5.pre.',
    )
    Color? backgroundColor,
    @Deprecated(
      'Use BottomAppBarTheme.color instead. '
      'This feature was deprecated after v3.3.0-0.6.pre.',
    )
    Color? bottomAppBarColor,
  }) {
    // GENERAL CONFIGURATION
    cupertinoOverrideTheme = cupertinoOverrideTheme?.noDefault();
    extensions ??= <ThemeExtension<dynamic>>[];
    inputDecorationTheme ??= InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      counterStyle: TextStyle(height: LineHeight.lg),
      border: const OutlineInputBorder(borderRadius: BorderRadius.xs),
      contentPadding: EdgeInsets.all(Spacing.nano.value),
      floatingLabelBehavior: mt.FloatingLabelBehavior.never,
      labelStyle: TextStyle(
        color: Colors.grey8,
        fontSize: FontSize.xxs,
        height: LineHeight.default_,
      ),
      helperStyle: TextStyle(
        color: Colors.grey5,
        fontSize: FontSize.xxs,
        height: LineHeight.default_,
      ),
    );
    platform ??= defaultTargetPlatform;
    switch (platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.iOS:
        materialTapTargetSize ??= MaterialTapTargetSize.padded;
        break;
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        materialTapTargetSize ??= MaterialTapTargetSize.shrinkWrap;
    }
    pageTransitionsTheme ??= const PageTransitionsTheme();
    scrollbarTheme ??= const ScrollbarThemeData();
    visualDensity ??= VisualDensity.defaultDensityForPlatform(platform);
    useMaterial3 ??= false;
    final bool useInkSparkle = platform == TargetPlatform.android && !kIsWeb;
    splashFactory ??= useMaterial3
        ? useInkSparkle
            ? InkSparkle.splashFactory
            : InkRipple.splashFactory
        : InkSplash.splashFactory;

    // COLOR
    assert(brightness == null || colorScheme.brightness == brightness);
    assert(colorSchemeSeed == null);
    assert(colorSchemeSeed == null || primarySwatch == null);
    assert(colorSchemeSeed == null || primaryColor == null);
    final Brightness effectiveBrightness =
        brightness ?? colorScheme.brightness ?? Brightness.light;
    final bool isDark = effectiveBrightness == Brightness.dark;
    if (colorSchemeSeed != null || useMaterial3) {
      if (colorSchemeSeed != null) {
        colorScheme = ColorScheme.fromSeed(
            seedColor: colorSchemeSeed, brightness: effectiveBrightness);
      }
      // For surfaces that use primary color in light themes and surface color in dark
      final Color primarySurfaceColor =
          isDark ? colorScheme.surface : colorScheme.primary;
      final Color onPrimarySurfaceColor =
          isDark ? colorScheme.onSurface : colorScheme.onPrimary;

      // Default some of the color settings to values from the color scheme
      primaryColor ??= primarySurfaceColor;
      primaryColorBrightness =
          mt.ThemeData.estimateBrightnessForColor(primarySurfaceColor);
      canvasColor ??= colorScheme.background;
      scaffoldBackgroundColor ??= colorScheme.background;
      bottomAppBarColor ??= colorScheme.surface;
      cardColor ??= colorScheme.surface;
      dividerColor ??= colorScheme.outline;
      backgroundColor ??= colorScheme.background;
      dialogBackgroundColor ??= colorScheme.background;
      indicatorColor ??= onPrimarySurfaceColor;
      errorColor ??= colorScheme.error;
      applyElevationOverlayColor ??= brightness == Brightness.dark;
    }
    applyElevationOverlayColor ??= false;
    primarySwatch ??= mt.MaterialColor(0xFF880E4F, {
      50: Color.fromRGBO(136, 14, 79, .1),
      100: Color.fromRGBO(136, 14, 79, .2),
      200: Color.fromRGBO(136, 14, 79, .3),
      300: Color.fromRGBO(136, 14, 79, .4),
      400: Color.fromRGBO(136, 14, 79, .5),
      500: Color.fromRGBO(136, 14, 79, .6),
      600: Color.fromRGBO(136, 14, 79, .7),
      700: Color.fromRGBO(136, 14, 79, .8),
      800: Color.fromRGBO(136, 14, 79, .9),
      900: Color.fromRGBO(136, 14, 79, 1),
    });
    primaryColor ??= isDark ? Colors.grey9 : primarySwatch;
    final Brightness estimatedPrimaryColorBrightness =
        mt.ThemeData.estimateBrightnessForColor(primaryColor);
    primaryColorLight ??= isDark ? Colors.grey5 : primarySwatch[100]!;
    primaryColorDark ??= isDark ? Colors.black : primarySwatch[700]!;
    final bool primaryIsDark =
        estimatedPrimaryColorBrightness == Brightness.dark;
    toggleableActiveColor ??= isDark ? Colors.yellow : (colorScheme.secondary);
    focusColor ??= isDark
        ? Colors.white.withOpacity(0.12)
        : Colors.black.withOpacity(0.12);
    hoverColor ??= isDark
        ? Colors.white.withOpacity(0.04)
        : Colors.black.withOpacity(0.04);
    shadowColor ??= Colors.black;
    canvasColor ??= isDark ? Colors.grey8 : Colors.grey1;
    scaffoldBackgroundColor ??= canvasColor;
    cardColor ??= isDark ? Colors.grey8 : Colors.white;
    dividerColor ??= isDark ? const Color(0x1FFFFFFF) : const Color(0x1F000000);
    // Create a ColorScheme that is backwards compatible as possible
    // with the existing default ThemeData color values.
    selectedRowColor ??= Colors.grey1;
    unselectedWidgetColor ??= isDark ? Colors.grey3 : Colors.grey8;
    // Spec doesn't specify a dark theme secondaryHeaderColor, this is a guess.
    secondaryHeaderColor ??= isDark ? Colors.grey7 : primarySwatch[50]!;
    dialogBackgroundColor ??= isDark ? Colors.grey8 : Colors.white;
    indicatorColor ??= colorScheme.secondary == primaryColor
        ? Colors.white
        : colorScheme.secondary;
    hintColor ??= isDark ? Colors.grey2 : Colors.black.withOpacity(0.6);
    // The default [buttonTheme] is here because it doesn't use the defaults for
    // [disabledColor], [highlightColor], and [splashColor].
    buttonTheme ??= ButtonThemeData(
      colorScheme: colorScheme,
      buttonColor: isDark ? primarySwatch[600]! : Colors.grey3,
      disabledColor: disabledColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      materialTapTargetSize: materialTapTargetSize,
    );
    disabledColor ??= isDark ? Colors.grey4 : Colors.grey7;
    highlightColor ??=
        isDark ? _kDarkThemeHighlightColor : _kLightThemeHighlightColor;
    splashColor ??= isDark ? _kDarkThemeSplashColor : _kLightThemeSplashColor;

    // TYPOGRAPHY & ICONOGRAPHY
    typography ??= useMaterial3
        ? Typography.material2021(platform: platform, colorScheme: colorScheme)
        : Typography.material2014(platform: platform);
    TextTheme defaultTextTheme = isDark ? typography.white : typography.black;
    TextTheme defaultPrimaryTextTheme =
        primaryIsDark ? typography.white : typography.black;
    if (fontFamily != null) {
      defaultTextTheme = defaultTextTheme.apply(fontFamily: fontFamily);
      defaultPrimaryTextTheme =
          defaultPrimaryTextTheme.apply(fontFamily: fontFamily);
    }
    if (fontFamilyFallback != null) {
      defaultTextTheme =
          defaultTextTheme.apply(fontFamilyFallback: fontFamilyFallback);
      defaultPrimaryTextTheme =
          defaultPrimaryTextTheme.apply(fontFamilyFallback: fontFamilyFallback);
    }
    if (package != null) {
      defaultTextTheme = defaultTextTheme.apply(package: package);
      defaultPrimaryTextTheme = defaultPrimaryTextTheme.apply(package: package);
    }
    textTheme ??= _buildTextTheme();
    textTheme = defaultTextTheme.merge(textTheme);
    primaryTextTheme = defaultPrimaryTextTheme.merge(primaryTextTheme);
    iconTheme ??= isDark
        ? const IconThemeData(color: kDefaultIconLightColor)
        : const IconThemeData(color: kDefaultIconDarkColor);
    primaryIconTheme ??= primaryIsDark
        ? const IconThemeData(color: Colors.white)
        : const IconThemeData(color: Colors.black);

    // COMPONENT THEMES
    appBarTheme ??= const AppBarTheme();
    badgeTheme ??= const BadgeThemeData();
    bannerTheme ??= const MaterialBannerThemeData();
    bottomAppBarTheme ??= const BottomAppBarTheme();
    bottomNavigationBarTheme ??= const BottomNavigationBarThemeData();
    bottomSheetTheme ??= const BottomSheetThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.xs));
    buttonBarTheme ??= const ButtonBarThemeData();
    cardTheme ??= const CardTheme();
    checkboxTheme ??= const CheckboxThemeData();
    chipTheme ??= const ChipThemeData();
    dataTableTheme ??= const DataTableThemeData();
    datePickerTheme ??= const DatePickerThemeData();
    dialogTheme ??= const DialogTheme();
    dividerTheme ??= const DividerThemeData();
    drawerTheme ??= const DrawerThemeData();
    dropdownMenuTheme ??= const DropdownMenuThemeData();
    elevatedButtonTheme ??= const ElevatedButtonThemeData();
    expansionTileTheme ??= const ExpansionTileThemeData();
    filledButtonTheme ??= const FilledButtonThemeData();
    floatingActionButtonTheme ??= const FloatingActionButtonThemeData();
    iconButtonTheme ??= const IconButtonThemeData();
    listTileTheme ??= const ListTileThemeData();
    menuBarTheme ??= const MenuBarThemeData();
    menuButtonTheme ??= const MenuButtonThemeData();
    menuTheme ??= const MenuThemeData();
    navigationBarTheme ??= const NavigationBarThemeData();
    navigationDrawerTheme ??= const NavigationDrawerThemeData();
    navigationRailTheme ??= const NavigationRailThemeData();
    outlinedButtonTheme ??= const OutlinedButtonThemeData();
    popupMenuTheme ??= const PopupMenuThemeData();
    progressIndicatorTheme ??= const ProgressIndicatorThemeData();
    radioTheme ??= const RadioThemeData();
    searchBarTheme ??= const SearchBarThemeData();
    searchViewTheme ??= const SearchViewThemeData();
    segmentedButtonTheme ??= const SegmentedButtonThemeData();
    sliderTheme ??= const SliderThemeData();
    snackBarTheme ??= const SnackBarThemeData();
    switchTheme ??= const SwitchThemeData();
    tabBarTheme ??= const TabBarTheme();
    textButtonTheme ??= const TextButtonThemeData();
    textSelectionTheme ??= const TextSelectionThemeData();
    timePickerTheme ??= const TimePickerThemeData();
    toggleButtonsTheme ??= const ToggleButtonsThemeData();
    tooltipTheme ??= const TooltipThemeData();

    // DEPRECATED (newest deprecations at the bottom)
    fixTextFieldOutlineLabel ??= true;
    primaryColorBrightness = estimatedPrimaryColorBrightness;
    errorColor ??= Colors.negativePure;
    backgroundColor ??= isDark ? Colors.grey7 : primarySwatch[200]!;
    bottomAppBarColor ??= colorSchemeSeed != null
        ? colorScheme.surface
        : isDark
            ? Colors.grey8
            : Colors.white;

    return ThemeData.raw(
      // For the sanity of the reader, make sure these properties are in the same
      // order in every place that they are separated by section comments (e.g.
      // GENERAL CONFIGURATION). Each section except for deprecations should be
      // alphabetical by symbol name.

      // GENERAL CONFIGURATION
      applyElevationOverlayColor: applyElevationOverlayColor,
      cupertinoOverrideTheme: cupertinoOverrideTheme,
      extensions: _themeExtensionIterableToMap(extensions),
      inputDecorationTheme: inputDecorationTheme,
      materialTapTargetSize: materialTapTargetSize,
      pageTransitionsTheme: pageTransitionsTheme,
      platform: platform,
      scrollbarTheme: scrollbarTheme,
      splashFactory: splashFactory,
      useMaterial3: useMaterial3,
      visualDensity: visualDensity,
      // COLOR
      canvasColor: canvasColor,
      cardColor: cardColor,
      colorScheme: colorScheme,
      dialogBackgroundColor: dialogBackgroundColor,
      disabledColor: disabledColor,
      dividerColor: dividerColor,
      focusColor: focusColor,
      highlightColor: highlightColor,
      hintColor: hintColor,
      hoverColor: hoverColor,
      indicatorColor: indicatorColor,
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      primaryColorLight: primaryColorLight,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      secondaryHeaderColor: secondaryHeaderColor,
      shadowColor: shadowColor,
      splashColor: splashColor,
      unselectedWidgetColor: unselectedWidgetColor,
      // TYPOGRAPHY & ICONOGRAPHY
      iconTheme: iconTheme,
      primaryTextTheme: primaryTextTheme,
      textTheme: textTheme,
      typography: typography,
      primaryIconTheme: primaryIconTheme,
      // COMPONENT THEMES
      actionIconTheme: actionIconTheme,
      appBarTheme: appBarTheme,
      badgeTheme: badgeTheme,
      bannerTheme: bannerTheme,
      bottomAppBarTheme: bottomAppBarTheme,
      bottomNavigationBarTheme: bottomNavigationBarTheme,
      bottomSheetTheme: bottomSheetTheme,
      buttonBarTheme: buttonBarTheme,
      buttonTheme: buttonTheme,
      cardTheme: cardTheme,
      checkboxTheme: checkboxTheme,
      chipTheme: chipTheme,
      dataTableTheme: dataTableTheme,
      datePickerTheme: datePickerTheme,
      dialogTheme: dialogTheme,
      dividerTheme: dividerTheme,
      drawerTheme: drawerTheme,
      dropdownMenuTheme: dropdownMenuTheme,
      elevatedButtonTheme: elevatedButtonTheme,
      expansionTileTheme: expansionTileTheme,
      filledButtonTheme: filledButtonTheme,
      floatingActionButtonTheme: floatingActionButtonTheme,
      iconButtonTheme: iconButtonTheme,
      listTileTheme: listTileTheme,
      menuBarTheme: menuBarTheme,
      menuButtonTheme: menuButtonTheme,
      menuTheme: menuTheme,
      navigationBarTheme: navigationBarTheme,
      navigationDrawerTheme: navigationDrawerTheme,
      navigationRailTheme: navigationRailTheme,
      outlinedButtonTheme: outlinedButtonTheme,
      popupMenuTheme: popupMenuTheme,
      progressIndicatorTheme: progressIndicatorTheme,
      radioTheme: radioTheme,
      searchBarTheme: searchBarTheme,
      searchViewTheme: searchViewTheme,
      segmentedButtonTheme: segmentedButtonTheme,
      sliderTheme: sliderTheme,
      snackBarTheme: snackBarTheme,
      switchTheme: switchTheme,
      tabBarTheme: tabBarTheme,
      textButtonTheme: textButtonTheme,
      textSelectionTheme: textSelectionTheme,
      timePickerTheme: timePickerTheme,
      toggleButtonsTheme: toggleButtonsTheme,
      tooltipTheme: tooltipTheme,
      // DEPRECATED (newest deprecations at the bottom)
      fixTextFieldOutlineLabel: fixTextFieldOutlineLabel,
      primaryColorBrightness: primaryColorBrightness,
      androidOverscrollIndicator: androidOverscrollIndicator,
      toggleableActiveColor: toggleableActiveColor,
      selectedRowColor: selectedRowColor,
      errorColor: errorColor,
      backgroundColor: backgroundColor,
      bottomAppBarColor: bottomAppBarColor,
    );
  }

  ThemeData.raw({
    required super.applyElevationOverlayColor,
    required super.cupertinoOverrideTheme,
    required super.extensions,
    required super.inputDecorationTheme,
    required super.materialTapTargetSize,
    required super.pageTransitionsTheme,
    required super.platform,
    required super.scrollbarTheme,
    required super.splashFactory,
    required super.useMaterial3,
    required super.visualDensity,
    required super.canvasColor,
    required super.cardColor,
    required super.colorScheme,
    required super.dialogBackgroundColor,
    required super.disabledColor,
    required super.dividerColor,
    required super.focusColor,
    required super.highlightColor,
    required super.hintColor,
    required super.hoverColor,
    required super.indicatorColor,
    required super.primaryColor,
    required super.primaryColorDark,
    required super.primaryColorLight,
    required super.scaffoldBackgroundColor,
    required super.secondaryHeaderColor,
    required super.shadowColor,
    required super.splashColor,
    required super.unselectedWidgetColor,
    required super.iconTheme,
    required super.primaryIconTheme,
    required super.primaryTextTheme,
    required super.textTheme,
    required super.typography,
    required super.actionIconTheme,
    required super.appBarTheme,
    required super.badgeTheme,
    required super.bannerTheme,
    required super.bottomAppBarTheme,
    required super.bottomNavigationBarTheme,
    required super.bottomSheetTheme,
    required super.buttonBarTheme,
    required super.buttonTheme,
    required super.cardTheme,
    required super.checkboxTheme,
    required super.chipTheme,
    required super.dataTableTheme,
    required super.datePickerTheme,
    required super.dialogTheme,
    required super.dividerTheme,
    required super.drawerTheme,
    required super.dropdownMenuTheme,
    required super.elevatedButtonTheme,
    required super.expansionTileTheme,
    required super.filledButtonTheme,
    required super.floatingActionButtonTheme,
    required super.iconButtonTheme,
    required super.listTileTheme,
    required super.menuBarTheme,
    required super.menuButtonTheme,
    required super.menuTheme,
    required super.navigationBarTheme,
    required super.navigationDrawerTheme,
    required super.navigationRailTheme,
    required super.outlinedButtonTheme,
    required super.popupMenuTheme,
    required super.progressIndicatorTheme,
    required super.radioTheme,
    required super.searchBarTheme,
    required super.searchViewTheme,
    required super.segmentedButtonTheme,
    required super.sliderTheme,
    required super.snackBarTheme,
    required super.switchTheme,
    required super.tabBarTheme,
    required super.textButtonTheme,
    required super.textSelectionTheme,
    required super.timePickerTheme,
    required super.toggleButtonsTheme,
    required super.tooltipTheme,
    //Deprecated
    required super.fixTextFieldOutlineLabel,
    required super.primaryColorBrightness,
    required super.androidOverscrollIndicator,
    required super.toggleableActiveColor,
    required super.selectedRowColor,
    required super.errorColor,
    required super.backgroundColor,
    required super.bottomAppBarColor,
  }) : super.raw();

  static Map<Object, ThemeExtension<dynamic>> _themeExtensionIterableToMap(
      Iterable<ThemeExtension<dynamic>> extensionsIterable) {
    return Map<Object, ThemeExtension<dynamic>>.unmodifiable(<Object,
        ThemeExtension<dynamic>>{
      // Strangely, the cast is necessary for tests to run.
      for (final ThemeExtension<dynamic> extension in extensionsIterable)
        extension.type: extension as ThemeExtension<ThemeExtension<dynamic>>,
    });
  }
}

const Color _kLightThemeHighlightColor = Color(0x66BCBCBC);
const Color _kLightThemeSplashColor = Color(0x66C8C8C8);
const Color _kDarkThemeHighlightColor = Color(0x40CCCCCC);
const Color _kDarkThemeSplashColor = Color(0x40CCCCCC);

TextTheme _buildTextTheme() {
  return TextTheme(
    bodyLarge: TextStyle(
      fontSize: FontSize.md,
      height: LineHeight.lg,
    ),
    bodyMedium: TextStyle(
      fontSize: FontSize.sm,
      height: LineHeight.lg,
    ),
    bodySmall: TextStyle(
      fontSize: FontSize.xs,
      height: LineHeight.lg,
    ),
    labelLarge: TextStyle(
      fontSize: FontSize.xs,
      height: LineHeight.lg,
    ),
    labelMedium: TextStyle(
      fontSize: FontSize.xxs,
      height: LineHeight.lg,
    ),
    labelSmall: TextStyle(
      fontSize: FontSize.xxxs,
      height: LineHeight.lg,
    ),
    titleLarge: TextStyle(
      //fontSize: FontSize.xl,
      height: LineHeight.lg,
    ),
    titleMedium: TextStyle(
      //fontSize: FontSize.lg.value,
      height: LineHeight.lg,
    ),
    titleSmall: TextStyle(
      //fontSize: FontSize.md,
      height: LineHeight.lg,
    ),
    headlineLarge: TextStyle(
      fontSize: FontSize.md,
      fontWeight: FontWeight.bold,
      height: LineHeight.lg,
    ),
    headlineMedium: TextStyle(
      fontSize: FontSize.sm,
      fontWeight: FontWeight.bold,
      height: LineHeight.lg,
    ),
    headlineSmall: TextStyle(
      fontSize: FontSize.xs,
      fontWeight: FontWeight.bold,
      height: LineHeight.lg,
    ),
    displayLarge: TextStyle(
      fontSize: FontSize.lg,
      fontWeight: FontWeight.bold,
      height: LineHeight.lg,
    ),
    displayMedium: TextStyle(
      fontSize: FontSize.sm,
      fontWeight: FontWeight.bold,
      height: LineHeight.lg,
    ),
    displaySmall: TextStyle(
      fontSize: FontSize.xxs,
      fontWeight: FontWeight.bold,
      height: LineHeight.lg,
    ),
  );
}
