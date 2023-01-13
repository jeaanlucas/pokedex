import 'dart:convert';

import 'abilities.model.dart';

class PokemonDetailsAbilitiesModel {
  PokemonDetailsAbilitiesModel({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory PokemonDetailsAbilitiesModel.fromJson(String str) =>
      PokemonDetailsAbilitiesModel.fromMap(json.decode(str));

  factory PokemonDetailsAbilitiesModel.fromMap(Map<String, dynamic> json) =>
      PokemonDetailsAbilitiesModel(
        ability: AbilitiesModel.fromMap(json['ability']),
        isHidden: json['is_hidden'],
        slot: json['slot'],
      );

  final AbilitiesModel ability;
  final bool isHidden;
  final int slot;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'ability': ability.toMap(),
        'is_hidden': isHidden,
        'slot': slot,
      };
}
