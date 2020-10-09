import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:infinimal/utils/apis.dart';
import 'package:infinimal/utils/downloading.dart';
import 'package:infinimal/utils/models.dart';
import 'package:infinimal/widgets/mini_widgets.dart';
import 'package:infinimal/utils/data.dart';
import 'package:infinimal/utils/themes.dart';

class PicturesScreen extends StatelessWidget {
  PicturesScreen(this.object);

  final AnimalObject object;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(object.name)),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: PicturesScreenBody(object),
      ),
    );
  }
}

class PicturesScreenBody extends StatefulWidget {
  PicturesScreenBody(this.object);

  final AnimalObject object;

  @override
  _PicturesScreenBodyState createState() => _PicturesScreenBodyState();
}

class _PicturesScreenBodyState extends State<PicturesScreenBody> {
  @override
  initState() {
    super.initState();
    api = ImageApi(widget.object);
    downloader = DownloadHelper();
    updateImage();
  }

  ImageApi api;
  DownloadHelper downloader;
  String imageUrl;
  Map<String, Color> buttonsColors;

  Future<void> _useOnInternet(Function function) async {
    final connection = await DataConnectionChecker().hasConnection;
    if (connection)
      function();
    else
      Toast.show('No internet connection', context);
  }

  void _showToast(String text) => Toast.show(text, context);

  void updateImage() async {
    _useOnInternet(() async {
      if (imageUrl != null) setState(() => imageUrl = null);
      final tempUrl = await api.getImage();
      if (mounted) setState(() => imageUrl = tempUrl);
    });
  }

  void downloadImage() async {
    _useOnInternet(() async {
      if (imageUrl != null) {
        final status = await downloader.download(imageUrl);
        switch (status) {
          case DownloadStatus.error:
            _showToast('Error while downloading happened');
            break;
          case DownloadStatus.noPerm:
            _showToast('No permissions granted');
            break;
          default:
            _showToast('Picture sucessfully downloaded');
        }
      } else {
        _showToast('Can\'t download unloaded image');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = DataObject().currentTheme(context).additions;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: ImageWithLoading(imageUrl),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RoundedButton(
              text: 'New picture',
              color: colors[buttonKeys[1]],
              onTap: updateImage,
              textColor: colors[buttonKeys[0]],
            ),
            RoundedButton(
              text: 'Download',
              color: colors[buttonKeys[2]],
              onTap: downloadImage,
              textColor: colors[buttonKeys[0]],
            ),
          ],
        ),
      ],
    );
  }
}
