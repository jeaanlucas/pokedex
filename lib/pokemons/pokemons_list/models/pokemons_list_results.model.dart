import 'dart:convert';

class PokemonsListResultsModel {
  PokemonsListResultsModel({
    required this.name,
    required this.url,
  });

  factory PokemonsListResultsModel.fromJson(String str) =>
      PokemonsListResultsModel.fromMap(json.decode(str));

  factory PokemonsListResultsModel.fromMap(Map<String, dynamic> json) =>
      PokemonsListResultsModel(
        name: json['name'],
        url: json['url'],
      );

  final String name;
  final String url;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'name': name,
        'url': url,
      };
}
