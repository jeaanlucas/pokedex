import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class IPokemonDetailsRepository extends Disposable {
  Future<Response> obterListPokemons(String url);
}
