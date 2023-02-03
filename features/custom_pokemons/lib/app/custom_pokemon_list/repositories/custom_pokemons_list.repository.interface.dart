import 'package:flutter_modular/flutter_modular.dart';

import '../models/custom_pokemons_list.model.dart';

abstract class ICustomPokemonsListRepository extends Disposable {
  Future<String?> obterPokemons();

  Future<void> updateCustomPokemonsListLocalStorage(
    List<CustomPokemonsListModel> pokemons,
  );
}