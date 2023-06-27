import 'package:flutter/gestures.dart';
import 'package:stardust/stardust.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.light(
              colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF2600FF)),
            ),
            darkTheme: ThemeData.dark(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.yellow, brightness: Brightness.dark),
            ),
            themeMode: currentMode,
            scrollBehavior: MyCustomScrollBehavior(),
            home: HomePage(),
            onGenerateRoute: onGenerateRoute,
          );
        });
  }

  Route? onGenerateRoute(settings) {
    int selectedNav = 0;
    switch (settings.name) {
      case '/typography':
        selectedNav = 0;
        break;
      case '/icons':
        selectedNav = 1;
        break;
      case '/inputs':
        selectedNav = 2;
        break;
      case '/others':
        selectedNav = 3;
        break;
    }
    return MaterialPageRoute(builder: (_) => HomePage(selectedNav));
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
