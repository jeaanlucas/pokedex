import 'package:commons_dependencies/commons_dependencies.dart';

abstract class IPokemonsListRepository extends Disposable {
  Future<Response> obterListPokemons(String url);
}
