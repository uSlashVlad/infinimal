import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinimal/utils/constants.dart';
// import 'package:infinimal/utils/models.dart';
import 'package:infinimal/widgets/mini_widgets.dart';
import 'package:infinimal/screens/settings_screen.dart';

/// Home screen with ist of all animals
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home screen')),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Animals.cat.listCard(),
          Animals.dog.listCard(),
          Animals.fox.listCard(),
          Animals.shibe.listCard(),
          SizedBox(height: 15),
          ListCard(
            screen: SettingsScreen(),
            title: 'Settings',
            icon: FontAwesomeIcons.cog,
          )
        ],
      ),
    );
  }
}
