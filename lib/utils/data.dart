import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:infinimal/utils/themes.dart';
import 'package:infinimal/utils/models.dart';
import 'package:infinimal/utils/constants.dart';

class DataObject {
  static final DataObject _singleton = DataObject._internal();
  factory DataObject() => _singleton;
  DataObject._internal();

  Box<String> _settingsBox;
  Box<String> get settingsBox => _settingsBox;

  CustomTheme currentTheme(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;

    final String themeMode = _settingsBox.get(settingsPrefsKeys[0]);
    final String lightTheme = _settingsBox.get(settingsPrefsKeys[1]);
    final String darkTheme = _settingsBox.get(settingsPrefsKeys[2]);

    final vars = settingsPrefsVariants[settingsPrefsKeys[0]];
    if (themeMode == vars[0]) {
      if (brightness == Brightness.light)
        return themes[lightTheme];
      else
        return themes[darkTheme];
    } else if (themeMode == vars[1]) {
      return themes[lightTheme];
    } else {
      return themes[darkTheme];
    }
  }

  Future<void> initialize() async {
    print('Data loading has been started...');
    await Hive.initFlutter();
    _settingsBox = await Hive.openBox<String>('settings');
    print('Data loading has been finished...');
  }
}
