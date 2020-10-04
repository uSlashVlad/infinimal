import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinimal/widgets/settings_ui.dart';
import 'package:infinimal/utils/data.dart';
import 'package:infinimal/utils/constants.dart';

class SettingsScreen extends StatelessWidget {
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _setBrightness(String val) {
    DataObject().settingsBox.put(settingsPrefsKeys[0], val);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SectionTitle('Theming'),
          Container(
            height: 100.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: [
                ThemingCard(
                  onTap: () => _setBrightness(
                      settingsPrefsVariants[settingsPrefsKeys[0]][0]),
                  title: 'System defaults',
                  description: 'Use system preferences',
                  icon: Icons.sync,
                ),
                ThemingCard(
                  onTap: () => _setBrightness(
                      settingsPrefsVariants[settingsPrefsKeys[0]][1]),
                  title: 'Light Theme',
                  description: 'Always use light theme',
                  icon: FontAwesomeIcons.sun,
                  bgColor: Colors.white,
                  textColor: Colors.grey[900],
                ),
                ThemingCard(
                  onTap: () => _setBrightness(
                      settingsPrefsVariants[settingsPrefsKeys[0]][2]),
                  title: 'Dark theme',
                  description: 'Always use dark theme',
                  icon: FontAwesomeIcons.moon,
                  bgColor: Colors.grey[850],
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
          SectionTitle('Sources'),
          SettingsTileButton(
            onPressed: () => _launchURL(sources['catApi']),
            icon: FontAwesomeIcons.sitemap,
            header: 'The Cat API',
          ),
          SettingsTileButton(
            onPressed: () => _launchURL(sources['dogApi']),
            icon: FontAwesomeIcons.sitemap,
            header: 'The Dog API',
          ),
          SettingsTileButton(
            onPressed: () => _launchURL(sources['foxApi']),
            icon: FontAwesomeIcons.sitemap,
            header: 'Random Fox API',
          ),
          SettingsTileButton(
            onPressed: () => _launchURL(sources['shibesApi']),
            icon: FontAwesomeIcons.sitemap,
            header: 'The Shibes API',
          ),
          SettingsTileButton(
            onPressed: () => _launchURL(sources['icon']),
            icon: FontAwesomeIcons.icons,
            header: 'Icon source',
            description: 'Icon author :)',
          ),
          SectionTitle('Credits'),
          SettingsTileButton(
            onPressed: () => _launchURL(sources['github']),
            icon: FontAwesomeIcons.github,
            header: 'Project repository',
          ),
          SettingsTileButton(
            onPressed: () => _launchURL(sources['telegram']),
            icon: FontAwesomeIcons.telegram,
            header: 'My personal Telegram',
          ),
          SettingsTileButton(
            onPressed: () => _launchURL(sources['discord']),
            icon: FontAwesomeIcons.discord,
            header: 'Our Discord server',
          ),
        ],
      ),
    );
  }
}
