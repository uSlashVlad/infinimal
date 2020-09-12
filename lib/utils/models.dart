import 'package:flutter/material.dart';
import 'package:infinimal/screens/pictures_screen.dart';
import 'package:infinimal/widgets/mini_widgets.dart';

enum AnimalType { Cat, Dog, Fox, Shibe }

class AnimalObject {
  AnimalObject({
    @required this.icon,
    @required this.name,
    @required this.apiUrl,
    @required this.type,
  });

  final IconData icon;
  final String name, apiUrl;
  final AnimalType type;

  Widget listCard() => AnimalListCard(this);

  PicturesScreen screen() => PicturesScreen(this);
}
