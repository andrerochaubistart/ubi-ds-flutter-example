import 'package:stardust/stardust.dart';

class TypographyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return ListView(
      padding: EdgeInsets.all(Spacing.xxxs.value),
      children: [
        Text('defalut'),
        Text('bodySmall', style: textTheme.bodySmall),
        Text('bodyMedium', style: textTheme.bodyMedium),
        Text('bodyLarge', style: textTheme.bodyLarge),
        Text('labelSmall', style: textTheme.labelSmall),
        Text('labelMedium', style: textTheme.labelMedium),
        Text('labelLarge', style: textTheme.labelLarge),
        Text('titleSmall', style: textTheme.titleSmall),
        Text('titleMedium', style: textTheme.titleMedium),
        Text('titleLarge', style: textTheme.titleLarge),
        Text('headlineSmall', style: textTheme.headlineSmall),
        Text('headlineMedium', style: textTheme.headlineMedium),
        Text('headlineLarge', style: textTheme.headlineLarge),
        Text('displaySmall', style: textTheme.displaySmall),
        Text('displayMedium', style: textTheme.displayMedium),
        Text('displayLarge', style: textTheme.displayLarge),
      ],
    );
  }
}
