import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

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
  Color corDeAcordoComOTipo(String type) {
    Map<String, Color> typeColors = {
      'NORMAL': const Color(0XFFA8A878),
      'FIGHTING': const Color(0XFFC03028),
      'FLYING': const Color(0XFFA890F0),
      'POISON': const Color(0XFFA040A0),
      'GROUND': const Color(0XFFE0C068),
      'ROCK': const Color(0XFFB8A038),
      'BUG': const Color(0XFFA8B820),
      'GHOST': const Color(0XFF705898),
      'STEEL': const Color(0XFFB8B8D0),
      'FIRE': const Color(0XFFF08030),
      'WATER': const Color(0XFF6890F0),
      'GRASS': const Color(0XFF78C850),
      'ELECTRIC': const Color(0XFFF8D030),
      'PSYCHIC': const Color(0XFFF85888),
      'ICE': const Color(0XFF98D8D8),
      'DRAGON': const Color(0XFF7038F8),
      'DARK': const Color(0XFF705848),
      'FAIRY': const Color(0XFFEE99AC),
      '???': const Color(0XFF68A090),
    };

    return typeColors[type.toUpperCase()] ?? const Color(0XFFA8A878);
  }
}
