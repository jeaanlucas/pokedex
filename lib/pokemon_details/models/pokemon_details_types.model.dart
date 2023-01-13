import 'dart:convert';

import 'type.model.dart';

class PokemonDetailsTypesModel {
  factory PokemonDetailsTypesModel.fromJson(String str) =>
      PokemonDetailsTypesModel.fromMap(json.decode(str));

  factory PokemonDetailsTypesModel.fromMap(Map<String, dynamic> json) =>
      PokemonDetailsTypesModel(
        slot: json['slot'],
        type: TypeModel.fromMap(json['type']),
      );

  PokemonDetailsTypesModel({
    required this.slot,
    required this.type,
  });

  final int slot;
  final TypeModel type;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'slot': slot,
        'type': type.toMap(),
      };
}
