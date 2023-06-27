import 'package:stardust/stardust.dart';

class ButtonsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(Spacing.xxxs.value),
      children: [
        PrimaryButton(label: 'PrimaryButton', onPressed: () {}),
        SizedBox(height: Spacing.nano.value),
        PrimaryButton(
          label: 'PrimaryButton (disable)',
          onPressed: null,
          iconRight: Icon(Icons.volume_max),
        ),
        SizedBox(height: Spacing.nano.value),
        PrimaryButton(
          label: 'PrimaryButton',
          onPressed: () {},
          iconLeft: Icon(Icons.volume_max),
        ),
        SizedBox(height: Spacing.nano.value),
        SecundaryButton(
          label: 'SecundaryButton',
          onPressed: () {},
          iconLeft: Icon(Icons.square2),
          iconRight: Icon(Icons.arrow_circle_left2),
        ),
        SizedBox(height: Spacing.nano.value),
        SecundaryButton(
          label: 'SecundaryButton (disable)',
          onPressed: null,
          iconRight: Icon(Icons.face_frown),
        ),
      ],
    );
  }
}
