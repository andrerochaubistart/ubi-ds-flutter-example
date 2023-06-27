import 'package:stardust/stardust.dart';

class BorderWidthList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(Spacing.xxxs.value),
      children: [
        for (var width in BorderWidth.values)
          Container(
            margin: EdgeInsets.all(Spacing.nano.value),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey3,
              border: Border(width: width),
            ),
          ),
      ],
    );
  }
}
