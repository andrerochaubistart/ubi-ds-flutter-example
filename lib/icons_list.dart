import 'dart:async';

import 'package:stardust/stardust.dart';

class IconsList extends StatefulWidget {
  @override
  State<IconsList> createState() => _IconsListState();
}

class _IconsListState extends State<IconsList> {
  Iterable<MapEntry> filtered = filterIcons('');
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
        decoration: InputDecoration(
            hintText: 'Find', prefixIcon: Icon(Icons.search_refraction2)),
        onChanged: filterList,
        key: ValueKey(0),
      ),
      Expanded(
          child: GridView(
        gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100),
        children: [
          for (var icon in filtered)
            Card(
                child: Tooltip(
              message: icon.key,
              child: GridTile(
                child: Icon(icon.value),
                footer: Text(icon.key, overflow: TextOverflow.ellipsis),
              ),
            ))
        ],
      ))
    ]);
  }

  void filterList(String value) {
    timer?.cancel();
    timer = Timer(Duration(milliseconds: 500), () {
      setState(() {
        filtered = filterIcons(value);
      });
    });
  }

  static Iterable<MapEntry> filterIcons(String search) {
    return Icons.all.entries
        .where((icon) => icon.key.contains(search.toLowerCase()));
  }
}
