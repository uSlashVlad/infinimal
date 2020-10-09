import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinimal/utils/models.dart';

const List<String> themeKeys = [
  'deflight',
  'pink',
  'defdark',
  'onedark',
  'monokai',
];
const List<String> buttonKeys = [
  'text',
  'new',
  'download',
];

final _lightTheme = ThemeData.light().copyWith(
  cardColor: Colors.grey[200],
);
final _darkTheme = ThemeData.dark();
final _pinkTheme = _lightTheme.copyWith(
  accentColor: Color(0xffe5b0ea),
  primaryColor: Color(0xffe5b0ea),
  appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline1: TextStyle(color: Color(0xff494949)),
      ),
      iconTheme: IconThemeData(color: Color(0xff494949))),
);
final _oneDarkTheme = _darkTheme.copyWith(
  accentColor: Color(0xff4d78cc),
  scaffoldBackgroundColor: Color(0xff282c34),
  cardColor: Color(0xff2c313c),
  appBarTheme: AppBarTheme(color: Color(0xff21252b)),
  textTheme: TextTheme(
    headline1: TextStyle(color: Color(0xffabb2bf)),
  ),
);
final _monokaiTheme = _darkTheme.copyWith(
  accentColor: Color(0xffffd866),
  scaffoldBackgroundColor: Color(0xff221f22),
  cardColor: Color(0xff2d2a2e),
  appBarTheme: AppBarTheme(color: Color(0xff19181a)),
  textTheme: TextTheme(
    headline1: TextStyle(color: Color(0xFF9E9A9E)),
  ),
);

final Map<String, Color> _defButtonsColors = {
  buttonKeys[0]: Colors.white,
  buttonKeys[1]: Color(0xff2196f3),
  buttonKeys[2]: Colors.yellow[800],
};
final Map<String, Color> _pastelButtonsColors = {
  buttonKeys[0]: Color(0xff494949),
  buttonKeys[1]: Color(0xff99d8d0),
  buttonKeys[2]: Color(0xfff0dd92),
};
final Map<String, Color> _onedarkButtonsColors = {
  buttonKeys[0]: Color(0xff21252b),
  buttonKeys[1]: Color(0xff61afef),
  buttonKeys[2]: Color(0xffe5c07b),
};
final Map<String, Color> _monokaiButtonsColors = {
  buttonKeys[0]: Color(0xff2d2a2e),
  buttonKeys[1]: Color(0xff78dce8),
  buttonKeys[2]: Color(0xfffc9867),
};

final Map<String, CustomTheme> themes = {
  themeKeys[0]: CustomTheme(
    title: 'Default light',
    description: 'Default light theme',
    icon: FontAwesomeIcons.sun,
    theme: _lightTheme,
    additions: _defButtonsColors,
  ),
  themeKeys[1]: CustomTheme(
    title: 'Pink!',
    description: 'Interesting',
    icon: FontAwesomeIcons.star,
    theme: _pinkTheme,
    additions: _pastelButtonsColors,
  ),
  themeKeys[2]: CustomTheme(
    title: 'Default dark',
    description: 'Default dark theme',
    icon: FontAwesomeIcons.moon,
    theme: _darkTheme,
    additions: _defButtonsColors,
    isDark: true,
  ),
  themeKeys[3]: CustomTheme(
    title: 'One Dark',
    description: 'Awesome color theme from Atom IDE',
    icon: FontAwesomeIcons.atom,
    theme: _oneDarkTheme,
    additions: _onedarkButtonsColors,
    isDark: true,
  ),
  themeKeys[4]: CustomTheme(
    title: 'Monokai Pro',
    description: 'One of my favorite IDE themes',
    icon: FontAwesomeIcons.code,
    theme: _monokaiTheme,
    additions: _monokaiButtonsColors,
    isDark: true,
  ),
};
