import 'package:infinimal/utils/models.dart';
import 'package:infinimal/utils/networking.dart';

class ImageApi {
  ImageApi(this.object);

  final AnimalObject object;

  Future<String> getImage() async {
    String url = object.apiUrl;
    final response = await NetworkHelper.getData(url);
    // print(response);
    return (object.type == AnimalType.Cat || object.type == AnimalType.Dog)
        ? response.data[0]['url']
        : (object.type == AnimalType.Fox)
            ? response.data['image']
            : response.data[0];
  }
}
