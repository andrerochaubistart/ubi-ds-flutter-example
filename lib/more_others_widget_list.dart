import 'package:stardust/stardust.dart';

import 'main.dart';

class MoreOthersWidgetsList extends StatefulWidget {
  @override
  State<MoreOthersWidgetsList> createState() => _MoreOthersWidgetsListState();
}

class _MoreOthersWidgetsListState extends State<MoreOthersWidgetsList> {
  var isExpandedNotImplemented = false;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return ListView(children: [
      Wrap(children: [
        Checkbox(value: true, onChanged: (value) {}),
        Checkbox(value: false, onChanged: (value) {}),
        Radio(value: null, groupValue: textTheme, onChanged: (_) {}),
        Radio(value: textTheme, groupValue: textTheme, onChanged: (_) {}),
      ]),
      LinkButton(label: 'Link Dark/Light', onPressed: dayNightToggle),
      Text('Tags:'),
      buildTags(),
      Text('Badges:'),
      buildBadges(),
      Menu(
        icon: Icons.mouse,
        title: Text('Menu branco'),
        children: [
          Menu(
            title: Text('sub i'),
            onTap: () {},
          ),
          Text('texto aleatorio')
        ],
      ),
      Menu(
        backgroundColor: Colors.grey7,
        title: Text('Menu'),
        icon: Icons.menu_01,
        children: [
          Menu(
            title: Text('Menu tap'),
            onTap: () {},
          ),
          Text('text'),
          Text('Item'),
          Menu(title: Text('Item with subitens'), children: [
            Menu(
              title: Text('Menu 1'),
              onTap: () {},
            ),
            Menu(
              title: Text('Menu 2'),
              children: [
                Menu(
                  title: Text('sub/sub'),
                  onTap: () {},
                )
              ],
            ),
            Text('sub 1'),
            Text('sub 3'),
          ])
        ],
      ),
      buildNotStylized(),
    ]);
  }

  buildNotStylized() => ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              isExpandedNotImplemented = !isExpanded;
            });
          },
          children: [
            ExpansionPanel(
                isExpanded: isExpandedNotImplemented,
                headerBuilder: (context, isExpanded) => Text('Not stylized'),
                body: Column(children: [
                  Wrap(
                    children: [
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                            labelText: 'DropdownButtonFormField'),
                        items: [
                          for (var i = 1; i < 10; i++)
                            DropdownMenuItem(
                              child: Text('Item $i'),
                              value: i,
                            )
                        ],
                        onChanged: (value) {
                          print('Value: $value');
                        },
                      ),
                      Switch(value: false, onChanged: (value) {}),
                      Switch(value: true, onChanged: (value) {}),
                    ],
                  ),
                ])),
          ]);

  buildTags() => Wrap(children: [
        Tag(
          expanded: true,
          label: Text('Tag1 Expandida'),
          iconRight: IconButton(
              icon: Icon(Icons.expand_01),
              onPressed: () {},
              padding: EdgeInsets.zero),
        ),
        for (var style in TagStyle.values)
          Padding(
            padding: EdgeInsets.all(Spacing.quark.value),
            child: Tag(
              style: style,
              label: Text('Tag1'),
            ),
          ),
        for (var style in TagStyle.values)
          Container(
            margin: EdgeInsets.all(Spacing.quark.value),
            child: Tag(
              style: style,
              label: Text('Tag2'),
              iconRight: IconButton(
                icon: Icon(Icons.asterisk_01),
                onPressed: () => print('Tag2 *'),
              ),
            ),
          ),
        for (var style in TagStyle.values)
          Container(
            margin: EdgeInsets.all(Spacing.quark.value),
            child: Tag(
              style: style,
              label: Text('Tag3'),
              iconLeft: Icon(Icons.x_close),
            ),
          ),
      ]);

  buildBadges() => Wrap(children: [
        Container(
          // width: double.infinity,
          margin: EdgeInsets.all(Spacing.quark.value),
          child: Badge(
            style: TagStyle.flat,
            label: Text('Badge Expanded'),
            expanded: true,
          ),
        ),
        for (var style in TagStyle.values)
          Container(
            margin: EdgeInsets.all(Spacing.quark.value),
            child: Badge(
              backgroundColor: Colors.green,
              style: style,
              label: Text('Badge1'),
            ),
          ),
        for (var style in TagStyle.values)
          Container(
            margin: EdgeInsets.all(Spacing.quark.value),
            child: Badge(
              style: style,
              label: Text('Badge2'),
            ),
          ),
        for (var style in TagStyle.values)
          Container(
            margin: EdgeInsets.all(Spacing.quark.value),
            child: Badge(
              backgroundColor: Colors.red,
              style: style,
              label: Text('Badge3'),
            ),
          ),
      ]);

  void dayNightToggle() {
    MyApp.themeNotifier.value = MyApp.themeNotifier.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
  }
}
