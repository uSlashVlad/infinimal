import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:infinimal/screens/home_screen.dart';
import 'package:infinimal/utils/data.dart';
import 'package:infinimal/utils/constants.dart';
import 'package:infinimal/utils/themes.dart';

/// Main function. App starts here
void main() async {
  await DataObject().initialize();
  runApp(MyApp());
  print('App has been started');
}

/// Main app widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Widget for settings loading
    return ValueListenableBuilder(
      valueListenable: DataObject().settingsBox.listenable(),
      builder: (context, box, child) {
        // Brightness mode loading
        final brightnessValStores = box.get(settingsPrefsKeys[0]);
        final themeMode = (brightnessValStores ==
                settingsPrefsVariants[settingsPrefsKeys[0]][1])
            ? ThemeMode.light
            : (brightnessValStores ==
                    settingsPrefsVariants[settingsPrefsKeys[0]][2])
                ? ThemeMode.dark
                : ThemeMode.system;

        // Light theme loading
        final lightThemeValStores = box.get(settingsPrefsKeys[1]);
        final lightTheme = themes[(lightThemeValStores != null)
                ? lightThemeValStores
                : themeKeys[0]]
            .theme;
        // Dark theme loading
        final darkThemeValStores = box.get(settingsPrefsKeys[2]);
        final darkTheme = themes[(darkThemeValStores != null)
                ? darkThemeValStores
                : themeKeys[1]]
            .theme;

        print(
            '$brightnessValStores, $lightThemeValStores, $darkThemeValStores');

        return MaterialApp(
          title: 'Infinimal',
          home: HomeScreen(),
          themeMode: themeMode,
          theme: lightTheme,
          darkTheme: darkTheme,
        );
      },
    );
  }
}
