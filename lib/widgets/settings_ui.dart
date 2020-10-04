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

class ThemingCard extends StatelessWidget {
  ThemingCard({
    @required this.title,
    @required this.onTap,
    this.description,
    this.icon,
    this.bgColor,
    this.textColor,
  });

  final Color bgColor, textColor;
  final String title, description;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bg = (bgColor != null) ? bgColor : theme.cardTheme.color;
    final text =
        (textColor != null) ? textColor : theme.textTheme.bodyText1.color;

    return Card(
      margin: EdgeInsets.all(10.0),
      elevation: 25.0,
      color: bg,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11.0)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(11.0),
        splashColor: text.withOpacity(0.17),
        child: Padding(
          padding: EdgeInsets.fromLTRB(15.0, 15.0, 11.5, 12.5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  size: 28.5,
                  color: text,
                ),
              SizedBox(width: 5.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: text,
                    ),
                  ),
                  SizedBox(height: 2.0),
                  if (description != null)
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: text.withOpacity(0.75),
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
