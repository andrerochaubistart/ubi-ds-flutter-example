import 'dart:math';

import 'package:dart_code_viewer2/dart_code_viewer2.dart';
import 'package:example/inputsList.dart';
import 'package:example/other_widgets_list.dart';
import 'package:example/typography_list.dart';
import 'package:flutter/services.dart';
import 'package:stardust/stardust.dart';

import 'icons_list.dart';

class HomePage extends StatefulWidget {
  int selectedTab;
  static var fileSourceView = ValueNotifier('');

  HomePage([this.selectedTab = 0]);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isExpandedNotImplemented = false;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      // An option to override the default breakpoints used for small, medium,
      // and large.
      // smallBreakpoint: const WidthPlatformBreakpoint(end: 700),
      // mediumBreakpoint: const WidthPlatformBreakpoint(begin: 700, end: 1000),
      // largeBreakpoint: const WidthPlatformBreakpoint(begin: 1000),
      useDrawer: false,
      appBar: AppBar(
        title: Text('Stardust'),
      ),
      selectedIndex: widget.selectedTab,
      onSelectedIndexChange: onSelectedIndexChange,
      destinations: const <NavigationDestination>[
        NavigationDestination(
          icon: Icon(Icons.paragraph_wrap),
          selectedIcon: Icon(Icons.paragraph_wrap2),
          label: 'Typography',
        ),
        NavigationDestination(
          icon: Icon(Icons.infinity),
          selectedIcon: Icon(Icons.cursor_click_01),
          label: 'Icons',
        ),
        NavigationDestination(
          icon: Icon(Icons.message_chat_circle),
          selectedIcon: Icon(Icons.message_chat_circle2),
          label: 'Inputs',
        ),
        NavigationDestination(
          icon: Icon(Icons.activity2),
          selectedIcon: Icon(Icons.activity),
          label: 'Others',
        ),
      ],
      body: (context) => buildBody(small: false),
      smallBody: (_) => buildBody(small: true),
      bodyRatio: 9 / 16,
      secondaryBody: buildSecundaryBody,
      // Override the default secondaryBody during the smallBreakpoint to be
      // empty. Must use AdaptiveScaffold.emptyBuilder to ensure it is properly
      // overridden.
      smallSecondaryBody: AdaptiveScaffold.emptyBuilder,
    );
  }

  buildBody({required bool small}) {
    switch (widget.selectedTab) {
      case 0:
        return TypographyList();
      case 1:
        return IconsList();
      case 2:
        return InputsList();
      case 3:
        return OtherWidgetsList();
    }
    return Container(color: Color(Random.secure().nextInt(0xFFFFFFFF)));
  }

  onSelectedIndexChange(int index) {
    String route = '';
    switch (index) {
      case 0:
        HomePage.fileSourceView.value = 'lib/typography_list.dart';
        route = '/typography';
        break;
      case 1:
        HomePage.fileSourceView.value = 'lib/icons_list.dart';
        route = '/icons';
        break;
      case 2:
        HomePage.fileSourceView.value = 'lib/inputsList.dart';
        route = '/inputs';
        break;
      case 3:
        HomePage.fileSourceView.value = 'lib/other_widgets_list.dart';
        route = '/others';
        break;
    }

    Navigator.pushReplacementNamed(context, route);
  }

  Widget buildSecundaryBody(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: HomePage.fileSourceView,
        builder: (context, value, child) {
          if (HomePage.fileSourceView.value.isNotEmpty)
            return FutureBuilder(
                future: rootBundle.loadString(HomePage.fileSourceView.value),
                builder: (context, snap) => snap.hasData
                    ? DartCodeViewer(snap.data!)
                    : CircularProgressIndicator());
          return Image.asset('images/splash_scren.jpg',
              repeat: ImageRepeat.repeat);
        });
  }
}
