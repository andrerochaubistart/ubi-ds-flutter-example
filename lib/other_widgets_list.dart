import 'package:example/border_radius_list.dart';
import 'package:example/border_width_list.dart';
import 'package:example/buttons_list.dart';
import 'package:example/more_others_widget_list.dart';
import 'package:stardust/stardust.dart';

import 'home_page.dart';

class OtherWidgetsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Column(children: [
        TabBar(onTap: onSelectedTab, tabs: [
          Tab(
            icon: Icon(Icons.cloud_01),
            text: 'Diversos',
          ),
          Tab(
            icon: Icon(Icons.alarm_clock_check),
            text: 'Buttons',
          ),
          Tab(
            icon: Icon(Icons.sun),
            text: 'Border Radius',
          ),
          Tab(
            icon: Icon(Icons.clipboard),
            text: 'Border Width',
          ),
        ]),
        Expanded(
            child: TabBarView(children: [
          MoreOthersWidgetsList(),
          ButtonsList(),
          BorderRadiusList(),
          BorderWidthList(),
        ])),
      ]),
    );
  }

  void onSelectedTab(int value) {
    switch (value) {
      case 0:
        HomePage.fileSourceView.value = 'lib/more_others_widget_list.dart';
        break;
      case 1:
        HomePage.fileSourceView.value = 'lib/buttons_list.dart';
        break;
      case 2:
        HomePage.fileSourceView.value = 'lib/border_radius_list.dart';
        break;
      case 3:
        HomePage.fileSourceView.value = 'lib/border_width_list.dart';
        break;
    }
  }
}
