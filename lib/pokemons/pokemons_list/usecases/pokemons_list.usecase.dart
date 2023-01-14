import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../models/pokemons_list.model.dart';
import '../repositories/pokemons_list.repository.dart';

class PokemonsListUseCase extends Disposable {
  final PokemonsListRepository _pokemonListRepository = Modular.get();

  Future<PokemonsListModel?> execute(String url) async {
    PokemonsListModel? pokemonListModel;

    try {
      Response response = await _pokemonListRepository.obterListPokemons(url);

      if (response.data != null) {
        pokemonListModel = PokemonsListModel.fromMap(response.data);
      }
    } catch (e) {
      rethrow;
    }

    return pokemonListModel;
  }

  @override
  void dispose() {}
}
