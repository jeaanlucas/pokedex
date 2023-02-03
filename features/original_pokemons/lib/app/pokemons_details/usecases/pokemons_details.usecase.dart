import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../models/pokemons_details.model.dart';
import '../repositories/pokemons_details.repository.dart';

class PokemonsDetailsUseCase extends Disposable {
  final PokemonsDetailsRepository _pokemonDetailsRepository = Modular.get();

  Future<PokemonsDetailsModel?> execute(String url) async {
    PokemonsDetailsModel? pokemonDetailsModel;

    try {
      Response response = await _pokemonDetailsRepository.obterListPokemons(url);

      if (response.data != null) {
        pokemonDetailsModel = PokemonsDetailsModel.fromMap(response.data);
      }
    } catch (e) {
      rethrow;
    }

    return pokemonDetailsModel;
  }

  @override
  void dispose() {}
}
