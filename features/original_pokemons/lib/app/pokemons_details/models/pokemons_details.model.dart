import 'dart:convert';

import 'pokemons_details_abilities.model.dart';
import 'pokemons_details_types.model.dart';

class PokemonsDetailsModel {
  PokemonsDetailsModel({
    required this.id,
    required this.name,
    required this.frontSpriteDefault,
    required this.backSpriteDefault,
    this.abilities,
    this.types,
  });

  factory PokemonsDetailsModel.fromJson(String str) =>
      PokemonsDetailsModel.fromMap(json.decode(str));

  factory PokemonsDetailsModel.fromMap(Map<String, dynamic> json) =>
      PokemonsDetailsModel(
        id: json['id'],
        name: json['name'],
        frontSpriteDefault: json['sprites']['front_default'],
        backSpriteDefault: json['sprites']['back_default'],
        abilities: json['abilities'] == null
            ? []
            : List<PokemonsDetailsAbilitiesModel>.from(
                json['abilities'].map(
                  (x) => PokemonsDetailsAbilitiesModel.fromMap(x),
                ),
              ),
        types: json['types'] == null
            ? []
            : List<PokemonsDetailsTypesModel>.from(
                json['types'].map(
                  (x) => PokemonsDetailsTypesModel.fromMap(x),
                ),
              ),
      );

  final List<PokemonsDetailsAbilitiesModel>? abilities;
  final int id;
  final String name;
  final String frontSpriteDefault;
  final String backSpriteDefault;
  final List<PokemonsDetailsTypesModel>? types;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'sprites': {
          'front_default': frontSpriteDefault,
          'back_default': backSpriteDefault,
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
