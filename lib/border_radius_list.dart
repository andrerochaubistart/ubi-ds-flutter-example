import 'package:stardust/stardust.dart';

class BorderRadiusList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Spacing.xxxs.value),
      child: SingleChildScrollView(
          child: Wrap(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.none,
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.xs,
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.sm,
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.md,
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.lg,
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            height: 100,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.pill,
            ),
          ),
          Container(
            padding: EdgeInsets.all(Spacing.nano.value),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ],
      )),
    );
  }
}
