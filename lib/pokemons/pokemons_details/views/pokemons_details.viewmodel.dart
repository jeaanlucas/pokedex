// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../config/constants.dart';
import '../models/pokemons_details.model.dart';
import '../usecases/pokemons_details.usecase.dart';

part 'pokemons_details.viewmodel.g.dart';

class PokemonsDetailsViewModel extends _PokemonsDetailsViewModelBase
    with _$PokemonsDetailsViewModel, Disposable {
  @override
  void dispose() {}
}

abstract class _PokemonsDetailsViewModelBase with Store {
  final PokemonsDetailsUseCase _pokemonDetailsUseCase = Modular.get();
  PokemonsDetailsModel? pokemonDetails;

  @observable
  bool loading = false;

  List<Color> abilitiesColors = [
    Colors.purpleAccent,
    Colors.lightGreen,
    Colors.pinkAccent,
  ];

  List<Color> typesColors = [
    Colors.cyanAccent,
    Colors.indigoAccent,
    Colors.limeAccent,
  ];

  @action
  Future<void> obterDetalhesPokemon(String url) async {
    try {
      loading = true;
      pokemonDetails = await _pokemonDetailsUseCase.execute(url);
      loading = false;
    } catch (e) {
      loading = false;
      rethrow;
    }
  }

  @action
  Color corDeAcordoComOTipo(String type) =>
      pokemonTypeColors[type.toUpperCase()] ?? const Color(0XFFA8A878);
}
