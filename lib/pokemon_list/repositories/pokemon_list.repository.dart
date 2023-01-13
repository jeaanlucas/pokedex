import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pokemon_list.repository.interface.dart';

class PokemonListRepository implements IPokemonListRepository {
  final Dio _dio = Modular.get();

  @override
  Future<Response> obterListPokemons(String url) async {
    try {
      return await _dio.get(url);
    } catch (e) {
      rethrow;
    }
  }

  @override
  void dispose() {}
}
