import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinimal/utils/constants.dart';
import 'package:infinimal/utils/models.dart';
import 'package:infinimal/widgets/mini_widgets.dart';
import 'package:infinimal/screens/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home screen')),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          animals[AnimalType.Cat].listCard(),
          animals[AnimalType.Dog].listCard(),
          animals[AnimalType.Fox].listCard(),
          animals[AnimalType.Shibe].listCard(),
          ListCard(screen: SettingsScreen(), title: 'Settings', icon: FontAwesomeIcons.cog)
        ],
      ),
    );
  }
}
