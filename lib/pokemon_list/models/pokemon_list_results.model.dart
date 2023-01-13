import 'dart:convert';

class PokemonListResultsModel {
  final String name;
  final String url;

  PokemonListResultsModel({
    required this.name,
    required this.url,
  });

  factory PokemonListResultsModel.fromJson(String str) =>
      PokemonListResultsModel.fromMap(json.decode(str));

  factory PokemonListResultsModel.fromMap(Map<String, dynamic> json) =>
      PokemonListResultsModel(
        name: json['name'],
        url: json['url'],
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'name': name,
        'url': url,
      };
}
