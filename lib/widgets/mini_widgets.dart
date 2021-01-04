import 'package:flutter/material.dart';
import 'package:infinimal/utils/models.dart';

/// Widget for main menu.
/// Just gets data from [object] and inserts into ListCard widget
class AnimalListCard extends StatelessWidget {
  AnimalListCard(this.object);

  final AnimalObject object;

  @override
  Widget build(BuildContext context) {
    return ListCard(
      screen: object.screen(),
      icon: object.icon,
      title: object.name,
      image: AssetImage(object.imageName),
    );
  }
}

/// Universal card with some styling.
/// Obviosly it is usefull for listz
class ListCard extends StatelessWidget {
  ListCard({
    required this.screen,
    required this.title,
    required this.icon,
    this.image,
  });

  final Widget screen;
  final String title;
  final IconData icon;
  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 13.0,
        vertical: 4.0,
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => screen,
            ),
          ),
          child: Column(
            children: [
              if (image != null)
                Padding(
                  padding: EdgeInsets.all(6.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(image: (image)!),
                  ),
                ),
              Padding(
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
            ],
          ),
        ),
      ),
    );
  }
}

/// Button for picture screen. Just rounded clickable button with styling.
class RoundedButton extends StatelessWidget {
  RoundedButton({
    required this.text,
    required this.color,
    required this.textColor,
    required this.onTap,
  });

  final String text;
  final Color color, textColor;
  final void Function() onTap;

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

/// Widget for picture screen. It is Image in card, that loads image data from
/// the internet and shows progress indicator while loading
class ImageWithLoading extends StatelessWidget {
  ImageWithLoading(this.imageUrl);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    bool pictureIsLoaded = false;

    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: (imageUrl != '')
              ? Image(
                  image: NetworkImage(imageUrl),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null && !pictureIsLoaded) {
                      if ((loadingProgress != null &&
                          loadingProgress.cumulativeBytesLoaded <
                              (loadingProgress.expectedTotalBytes)!)) {
                        return CircularProgressIndicator(
                          value: loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes)!,
                        );
                      }
                      return CircularProgressIndicator();
                    } else {
                      pictureIsLoaded = true;
                      return child;
                    }
                  },
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
