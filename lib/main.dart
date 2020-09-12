import 'package:flutter/material.dart';
import 'package:infinimal/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infinimal',
      home: HomeScreen(),
      darkTheme: ThemeData.dark(),
    );
  }
}
