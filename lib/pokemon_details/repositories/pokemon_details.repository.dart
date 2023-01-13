import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pokemon_details.repository.interface.dart';

class PokemonDetailsRepository implements IPokemonDetailsRepository {
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
