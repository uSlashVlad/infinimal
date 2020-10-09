import 'package:flutter/material.dart';
import 'package:infinimal/utils/models.dart';
import 'package:infinimal/utils/themes.dart';
import 'package:infinimal/widgets/settings_ui.dart';
import 'package:infinimal/utils/constants.dart';
import 'package:infinimal/utils/data.dart';

class ThemesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Themes'),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, ind) {
          CustomTheme theme = themes[themeKeys[ind]];
          return ThemingCard(
            title: theme.title,
            description: (theme.description != null) ? theme.description : '',
            icon: theme.icon,
            bgColor: theme.theme.cardColor,
            textColor: theme.theme.textTheme.headline1.color,
            onTap: () => DataObject().settingsBox.put(
                (theme.isDark) ? settingsPrefsKeys[2] : settingsPrefsKeys[1],
                themeKeys[ind]),
          );
        },
        itemCount: themes.length,
      ),
    );
  }
}
