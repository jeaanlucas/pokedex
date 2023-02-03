import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class IPokemonsDetailsRepository extends Disposable {
  Future<Response> obterListPokemons(String url);
}
