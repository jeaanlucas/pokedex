import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import '../../../utils/local_data.repository.dart';
import '../models/custom_pokemons_list.model.dart';
import '../repositories/custom_pokemons_list.repository.dart';

class CustomPokemonsListUseCase extends Disposable {
  final CustomPokemonsListRepository _pokemonListRepository = Modular.get();
  final LocalDataRepository _localDataRepository = Modular.get();
  final List<CustomPokemonsListModel> _pokemonList = [];

  Future<void> execute(
      bool atualizarPokemon, CustomPokemonsListModel novoPokemon) async {
    try {
      _pokemonList.clear();
      String? pokemonStorage = await _localDataRepository.read('pokemons');

      _adicionaPokemonEmCasoDeStorageJaPossuirAlgumPokemon(pokemonStorage);
      _atualizaOuInserePokemonNaListagem(atualizarPokemon, novoPokemon);

      await _pokemonListRepository
          .updateCustomPokemonsListLocalStorage(_pokemonList);
    } catch (e) {
      rethrow;
    }
  }

  void _adicionaPokemonEmCasoDeStorageJaPossuirAlgumPokemon(
      String? pokemonStorage) {
    if (pokemonStorage != null) {
      List<dynamic> jsonPokemons = json.decode(pokemonStorage);

      if (jsonPokemons.isNotEmpty) {
        for (dynamic poke in jsonPokemons) {
          _pokemonList.add(CustomPokemonsListModel.fromJson(poke));
        }
      }
    }
  }

  void _atualizaOuInserePokemonNaListagem(
      bool atualizarPokemon, CustomPokemonsListModel novoPokemon) {
    if (atualizarPokemon) {
      _pokemonList[_pokemonList.indexWhere(
        (element) => element.uuid == novoPokemon.uuid,
      )] = novoPokemon;
      return;
    }

    _pokemonList.add(
      CustomPokemonsListModel.fromJson(novoPokemon.toJson()),
    );
    return;
  }

  @override
  void dispose() {}
}
