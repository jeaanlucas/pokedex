import 'dart:convert';

import 'pokemon_details_abilities.model.dart';
import 'pokemon_details_types.model.dart';

class PokemonDetailsModel {
  PokemonDetailsModel({
    required this.id,
    required this.name,
    required this.frontSpriteDefault,
    this.abilities,
    this.types,
  });

  factory PokemonDetailsModel.fromJson(String str) =>
      PokemonDetailsModel.fromMap(json.decode(str));

  factory PokemonDetailsModel.fromMap(Map<String, dynamic> json) =>
      PokemonDetailsModel(
        id: json['id'],
        name: json['name'],
        frontSpriteDefault: json['sprites']['front_default'],
        abilities: json['abilities'] == null
            ? []
            : List<PokemonDetailsAbilitiesModel>.from(
                json['abilities'].map(
                  (x) => PokemonDetailsAbilitiesModel.fromMap(x),
                ),
              ),
        types: json['types'] == null
            ? []
            : List<PokemonDetailsTypesModel>.from(
                json['types'].map(
                  (x) => PokemonDetailsTypesModel.fromMap(x),
                ),
              ),
      );

  final List<PokemonDetailsAbilitiesModel>? abilities;
  final int id;
  final String name;
  final String frontSpriteDefault;
  final List<PokemonDetailsTypesModel>? types;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'sprites': {
          'front_default': frontSpriteDefault,
        },
        'abilities': abilities == null
            ? []
            : List<dynamic>.from(
                abilities!.map(
                  (x) => x.toMap(),
                ),
              ),
        'types': types == null
            ? []
            : List<dynamic>.from(
                types!.map(
                  (x) => x.toMap(),
                ),
              ),
      };
}
