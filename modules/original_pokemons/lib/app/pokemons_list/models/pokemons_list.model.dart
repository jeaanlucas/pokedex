import 'dart:convert';

import 'pokemons_list_results.model.dart';

class PokemonsListModel {
  PokemonsListModel({
    required this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory PokemonsListModel.fromJson(String str) =>
      PokemonsListModel.fromMap(json.decode(str));

  factory PokemonsListModel.fromMap(Map<String, dynamic> json) =>
      PokemonsListModel(
        count: json['count'],
        next: json['next'],
        previous: json['previous'],
        results: json['results'] == null
            ? []
            : List<PokemonsListResultsModel>.from(
                json['results'].map(
                  (x) => PokemonsListResultsModel.fromMap(x),
                ),
              ),
      );

  final int count;
  final String? next;
  final String? previous;
  final List<PokemonsListResultsModel>? results;

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
