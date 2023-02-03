import 'dart:convert';

import 'type.model.dart';

class PokemonsDetailsTypesModel {
  factory PokemonsDetailsTypesModel.fromJson(String str) =>
      PokemonsDetailsTypesModel.fromMap(json.decode(str));

  factory PokemonsDetailsTypesModel.fromMap(Map<String, dynamic> json) =>
      PokemonsDetailsTypesModel(
        slot: json['slot'],
        type: TypeModel.fromMap(json['type']),
      );

  PokemonsDetailsTypesModel({
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
