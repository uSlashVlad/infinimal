import 'package:flutter/material.dart';
import 'package:infinimal/screens/pictures_screen.dart';
import 'package:infinimal/widgets/mini_widgets.dart';

enum AnimalType { Cat, Dog, Fox, Shibe }

class AnimalObject {
  AnimalObject({
    required this.icon,
    required this.name,
    required this.apiUrl,
    required this.type,
    required this.imageName,
  });

  final IconData icon;
  final String name, apiUrl, imageName;
  final AnimalType type;

  Widget listCard() => AnimalListCard(this);

  PicturesScreen screen() => PicturesScreen(this);
}

class CustomTheme {
  CustomTheme({
    required this.theme,
    this.isDark = false,
    this.additions,
    required this.title,
    this.description,
    required this.icon,
  });

  final bool isDark;
  final String title;
  final String? description;
  final IconData icon;
  final ThemeData theme;
  final Map<String, Color>? additions;
}
