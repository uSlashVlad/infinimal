import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DataObject {
  static final DataObject _singleton = DataObject._internal();
  factory DataObject() => _singleton;
  DataObject._internal();

  Box<String> _settingsBox;
  Box<String> get settingsBox => _settingsBox;

  Future<void> initialize() async {
    print('Data loading has been started...');
    await Hive.initFlutter();
    _settingsBox = await Hive.openBox<String>('settings');
    print('Data loading has been finished...');
  }
}
