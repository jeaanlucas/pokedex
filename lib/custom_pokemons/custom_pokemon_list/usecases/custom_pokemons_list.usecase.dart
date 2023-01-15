// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../models/custom_pokemons_list.model.dart';
import '../repositories/custom_pokemons_list.repository.dart';

class CustomPokemonsListUseCase extends Disposable {
  final CustomPokemonsListRepository _customPokemonsListRepository =
      Modular.get();
  final ObservableList<CustomPokemonsListModel> _pokemonList = ObservableList<CustomPokemonsListModel>();

  Future<ObservableList<CustomPokemonsListModel>> execute() async {
    try {
      String? pokemonStorage =
          await _customPokemonsListRepository.obterPokemons();

      _pokemonList.clear();
      _adicionaPokemonEmCasoDeStorageJaPossuirAlgumPokemon(pokemonStorage);

      return _pokemonList;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateCustomPokemons(
    bool atualizarPokemon,
    CustomPokemonsListModel novoPokemon,
  ) async {
    try {
      _pokemonList.clear();
      String? pokemonStorage =
          await _customPokemonsListRepository.obterPokemons();

      _adicionaPokemonEmCasoDeStorageJaPossuirAlgumPokemon(pokemonStorage);
      _atualizaOuInserePokemonNaListagem(atualizarPokemon, novoPokemon);

      await _customPokemonsListRepository
          .updateCustomPokemonsListLocalStorage(_pokemonList);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeCustomPokemon(
    List<CustomPokemonsListModel> updatedList,
  ) async {
    try {
      await _customPokemonsListRepository
          .updateCustomPokemonsListLocalStorage(updatedList);
    } catch (e) {
      rethrow;
    }
  }

  void _adicionaPokemonEmCasoDeStorageJaPossuirAlgumPokemon(
    String? pokemonStorage,
  ) {
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
    bool atualizarPokemon,
    CustomPokemonsListModel novoPokemon,
  ) {
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
