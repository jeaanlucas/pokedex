import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_dex/pokemon_list/models/pokemon_list.model.dart';
import 'package:poke_dex/pokemon_list/repositories/pokemon_list.repository.dart';

import '../models/pokemon_details.model.dart';
import '../repositories/pokemon_details.repository.dart';

class PokemonDetailsUseCase extends Disposable {
  final PokemonDetailsRepository _pokemonDetailsRepository = Modular.get();

  Future<PokemonDetailsModel?> execute(String url) async {
    PokemonDetailsModel? pokemonDetailsModel;

    try {
      Response response = await _pokemonDetailsRepository.obterListPokemons(url);

      if (response.data != null) {
        pokemonDetailsModel = PokemonDetailsModel.fromMap(response.data);
      }
    } catch (e) {
      rethrow;
    }

    return pokemonDetailsModel;
  }

  @override
  void dispose() {}
}
