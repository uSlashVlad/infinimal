import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'models.dart';

Map<AnimalType, AnimalObject> animals = {
  AnimalType.Cat: AnimalObject(
    icon: FontAwesomeIcons.cat,
    name: 'Cat',
    apiUrl: 'https://api.thecatapi.com/v1/images/search/',
    type: AnimalType.Cat,
  ),
  AnimalType.Dog: AnimalObject(
    icon: FontAwesomeIcons.dog,
    name: 'Dog',
    apiUrl: 'https://api.thedogapi.com/v1/images/search/',
    type: AnimalType.Dog,
  ),
  AnimalType.Shibe: AnimalObject(
    icon: FontAwesomeIcons.dog,
    name: 'Shiba inu',
    apiUrl: 'http://shibe.online/api/shibes',
    type: AnimalType.Shibe,
  ),
  AnimalType.Fox: AnimalObject(
    icon: FontAwesomeIcons.firefox,
    name: 'Fox',
    apiUrl: 'https://randomfox.ca/floof/',
    type: AnimalType.Fox,
  ),
};
