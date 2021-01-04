import 'package:flutter/material.dart';

/// Simple widget with just text with accent color and some font styling
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
          fontSize: 19.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      padding: EdgeInsets.fromLTRB(25, 10, 0, 10),
    );
  }
}

/// Widget that looks like native android tiles.
/// Has icon, title, description. Clickable
class SettingsTileButton extends StatelessWidget {
  SettingsTileButton({
    @required this.onTap,
    @required this.icon,
    @required this.header,
    this.description = '',
  });

  final Function onTap;
  final IconData icon;
  final String header, description;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: _SettingsTileInner(
        icon: icon,
        header: header,
        description: description,
      ),
    );
  }
}

/// More reusable than [SettingsTileButton],
/// can be used not only as button
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
        horizontal: 17.75,
        vertical: 13,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            icon,
            size: 26.5,
            color: theme.accentColor,
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                header,
                style: TextStyle(
                  fontSize: 20.5,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16.5,
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

/// Awesome card with custom styles.
/// It is used in settings for brightness mode,
/// on themes screen for themes cards
class ThemingCard extends StatelessWidget {
  ThemingCard({
    @required this.title,
    @required this.onTap,
    this.description,
    this.icon,
    this.trailingIcon,
    this.bgColor,
    this.textColor,
  });

  final Color bgColor, textColor;
  final String title, description;
  final IconData icon, trailingIcon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bg = (bgColor != null) ? bgColor : theme.cardTheme.color;
    final text =
        (textColor != null) ? textColor : theme.textTheme.headline1.color;

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
              SizedBox(width: 10.0),
              SizedBox(width: 5.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: text,
                        ),
                      ),
                      SizedBox(width: 10),
                      if (trailingIcon != null)
                        Icon(
                          trailingIcon,
                          color: text,
                          size: 15,
                        ),
                    ],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
