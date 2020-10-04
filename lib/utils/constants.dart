import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'models.dart';

final Map<AnimalType, AnimalObject> animals = {
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

const Map<String, String> sources = {
  'catApi': 'https://thecatapi.com/',
  'dogApi': 'https://thedogapi.com/',
  'foxApi': 'https://randomfox.ca/',
  'shibesApi': 'https://shibe.online/',
  'github': 'https://github.com/uSlashVlad/infinimal',
  'telegram': 'https://t.me/uslashvlad/',
  'discord': 'https://discord.gg/mGJJMr7/',
  'icon': 'https://www.flaticon.com/authors/freepik'
};

const List<String> settingsPrefsKeys = [
  'brightness',
];

const Map<String, dynamic> settingsPrefsVariants = {
  'brightness': ['system', 'light', 'dark'],
};
