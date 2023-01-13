import 'dart:convert';

import 'pokemon_list_results.model.dart';

class PokemonListModel {
  PokemonListModel({
    required this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory PokemonListModel.fromJson(String str) =>
      PokemonListModel.fromMap(json.decode(str));

  factory PokemonListModel.fromMap(Map<String, dynamic> json) =>
      PokemonListModel(
        count: json['count'],
        next: json['next'],
        previous: json['previous'],
        results: json['results'] == null
            ? []
            : List<PokemonListResultsModel>.from(
                json['results'].map(
                  (x) => PokemonListResultsModel.fromMap(x),
                ),
              ),
      );

  final int count;
  final String? next;
  final String? previous;
  final List<PokemonListResultsModel>? results;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'count': count,
        'next': next,
        'previous': previous,
        'results': results == null
            ? []
            : List<dynamic>.from(
                results!.map(
                  (x) => x.toMap(),
                ),
              ),
      };
}
