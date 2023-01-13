import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../models/pokemon_list.model.dart';
import '../repositories/pokemon_list.repository.dart';

class PokemonListUseCase extends Disposable {
  final PokemonListRepository _pokemonListRepository = Modular.get();

  Future<PokemonListModel?> execute(String url) async {
    PokemonListModel? pokemonListModel;

    try {
      Response response = await _pokemonListRepository.obterListPokemons(url);

      if (response.data != null) {
        pokemonListModel = PokemonListModel.fromMap(response.data);
      }
    } catch (e) {
      rethrow;
    }

    return pokemonListModel;
  }

  @override
  void dispose() {}
}
