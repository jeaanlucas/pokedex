import 'dart:convert';

import 'custom_pokemons_abilities.model.dart';

class CustomPokemonsListModel {
  CustomPokemonsListModel({
    required this.uuid,
    required this.pathImage,
    required this.name,
    required this.abilities,
  });

  factory CustomPokemonsListModel.fromJson(String str) =>
      CustomPokemonsListModel.fromMap(json.decode(str));

  factory CustomPokemonsListModel.fromMap(Map<String, dynamic> json) =>
      CustomPokemonsListModel(
        uuid: json['uuid'],
        pathImage: json['pathImage'],
        name: json['name'],
        abilities: json['abilities'] == null
            ? []
            : List<CustomPokemonsAbilitiesModel>.from(
                json['abilities'].map(
                  (x) => CustomPokemonsAbilitiesModel.fromMap(x),
                ),
              ),
      );

  final String uuid;
  final String pathImage;
  final String name;
  final List<CustomPokemonsAbilitiesModel> abilities;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'uuid': uuid,
        'pathImage': pathImage,
        'name': name,
        'abilities': List<dynamic>.from(
          abilities!.map(
            (x) => x.toMap(),
          ),
        ),
      };
}
