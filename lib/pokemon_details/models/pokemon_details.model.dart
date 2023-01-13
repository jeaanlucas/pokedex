import 'dart:convert';

import 'package:poke_dex/pokemon_list/models/pokemon_list_results.model.dart';

class PokemonDetailsModel {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonListResultsModel>? results;

  PokemonDetailsModel({
    required this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory PokemonDetailsModel.fromJson(String str) =>
      PokemonDetailsModel.fromMap(json.decode(str));

  factory PokemonDetailsModel.fromMap(Map<String, dynamic> json) =>
      PokemonDetailsModel(
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
