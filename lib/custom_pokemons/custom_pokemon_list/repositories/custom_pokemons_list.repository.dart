import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';

import '../../../utils/local_data.repository.dart';
import '../models/custom_pokemons_list.model.dart';
import 'custom_pokemons_list.repository.interface.dart';

class CustomPokemonsListRepository implements ICustomPokemonsListRepository {
  final LocalDataRepository _localDataRepository = Modular.get();

  @override
  Future<String?> obterPokemons() async {
    try {
      return await _localDataRepository.read('pokemons');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateCustomPokemonsListLocalStorage(
    List<CustomPokemonsListModel> pokemons,
  ) async {
    try {
      await _localDataRepository.insertOrUpdate(
        'pokemons',
        json.encode(pokemons),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  void dispose() {}
}
