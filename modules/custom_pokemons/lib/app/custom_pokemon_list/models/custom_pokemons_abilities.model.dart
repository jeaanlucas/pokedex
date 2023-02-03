import 'dart:convert';

class CustomPokemonsAbilitiesModel {
  factory CustomPokemonsAbilitiesModel.fromMap(Map<String, dynamic> json) =>
      CustomPokemonsAbilitiesModel(
        uuid: json['uuid'],
        name: json['name'],
      );

  factory CustomPokemonsAbilitiesModel.fromJson(String str) =>
      CustomPokemonsAbilitiesModel.fromMap(json.decode(str));

  CustomPokemonsAbilitiesModel({
    required this.uuid,
    required this.name,
  });

  final String uuid;
  final String name;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'uuid': uuid,
        'name': name,
      };
}
