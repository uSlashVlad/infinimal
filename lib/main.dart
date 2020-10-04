import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:infinimal/screens/home_screen.dart';
import 'package:infinimal/utils/data.dart';
import 'package:infinimal/utils/constants.dart';

void main() async {
  await DataObject().initialize();
  runApp(MyApp());
  print('App has been started');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: DataObject().settingsBox.listenable(),
      builder: (context, box, child) {
        final brightnessValStores = box.get(settingsPrefsKeys[0]);
        final themeMode = (brightnessValStores ==
                settingsPrefsVariants[settingsPrefsKeys[0]][1])
            ? ThemeMode.light
            : (brightnessValStores ==
                    settingsPrefsVariants[settingsPrefsKeys[0]][2])
                ? ThemeMode.dark
                : ThemeMode.system;
        return MaterialApp(
          title: 'Infinimal',
          home: HomeScreen(),
          themeMode: themeMode,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
        );
      },
    );
  }
}
