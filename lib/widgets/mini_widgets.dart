import 'package:flutter/material.dart';
import 'package:infinimal/utils/models.dart';

class AnimalListCard extends StatelessWidget {
  AnimalListCard(this.object);

  final AnimalObject object;

  @override
  Widget build(BuildContext context) {
    return ListCard(
      screen: object.screen(),
      icon: object.icon,
      title: object.name,
    );
  }
}

class ListCard extends StatelessWidget {
  ListCard({
    @required this.screen,
    @required this.title,
    @required this.icon,
  });

  final Widget screen;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 13.0,
        vertical: 4.0,
      ),
      child: Card(
        child: FlatButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => screen,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(icon, size: 25),
                SizedBox(width: 15),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  RoundedButton({
    @required this.text,
    @required this.color,
    @required this.textColor,
    @required this.onTap,
  });

  final String text;
  final Color color, textColor;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 6.0,
        vertical: 4.0,
      ),
      child: MaterialButton(
        onPressed: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        color: color,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 27.5,
            ),
          ),
        ),
      ),
    );
  }
}
