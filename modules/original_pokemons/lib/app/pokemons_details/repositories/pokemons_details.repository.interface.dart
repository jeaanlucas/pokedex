import 'package:commons_dependencies/commons_dependencies.dart';

abstract class IPokemonsDetailsRepository extends Disposable {
  Future<Response> obterListPokemons(String url);
}
