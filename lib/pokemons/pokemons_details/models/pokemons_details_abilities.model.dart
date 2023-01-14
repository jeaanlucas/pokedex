import 'dart:convert';

import 'abilities.model.dart';

class PokemonsDetailsAbilitiesModel {
  PokemonsDetailsAbilitiesModel({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory PokemonsDetailsAbilitiesModel.fromJson(String str) =>
      PokemonsDetailsAbilitiesModel.fromMap(json.decode(str));

  factory PokemonsDetailsAbilitiesModel.fromMap(Map<String, dynamic> json) =>
      PokemonsDetailsAbilitiesModel(
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
