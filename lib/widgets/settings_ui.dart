import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      child: Text(
        text,
        style: TextStyle(
          color: theme.accentColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      padding: EdgeInsets.fromLTRB(25, 10, 0, 10),
    );
  }
}

class SettingsTileButton extends StatelessWidget {
  SettingsTileButton({
    @required this.onPressed,
    @required this.icon,
    @required this.header,
    this.description = '',
  });

  final Function onPressed;
  final IconData icon;
  final String header, description;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: _SettingsTileInner(
        icon: icon,
        header: header,
        description: description,
      ),
    );
  }
}

class _SettingsTileInner extends StatelessWidget {
  _SettingsTileInner({
    @required this.icon,
    @required this.header,
    @required this.description,
  });

  final IconData icon;
  final String header, description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 13,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            icon,
            size: 30,
            color: theme.accentColor,
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                header,
                style: TextStyle(
                  fontSize: 22.5,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 18,
                  color: theme.textTheme.headline1.color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
