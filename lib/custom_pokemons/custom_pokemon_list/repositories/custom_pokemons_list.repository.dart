import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';

import '../../../utils/local_data.repository.dart';
import '../models/custom_pokemons_list.model.dart';
import 'custom_pokemons_list.repository.interface.dart';

class CustomPokemonsListRepository implements ICustomPokemonsListRepository {
  final LocalDataRepository _localDataRepository = Modular.get();

  @override
  Future<void> updateCustomPokemonsListLocalStorage(
      List<CustomPokemonsListModel> pokemons) async {
    await _localDataRepository.insertOrUpdate(
      'pokemons',
      json.encode(pokemons),
    );
  }

  @override
  void dispose() {}
}
