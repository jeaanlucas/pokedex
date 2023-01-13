import 'dart:convert';

class PokemonListResultsModel {
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

  final String name;
  final String url;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'name': name,
        'url': url,
      };
}