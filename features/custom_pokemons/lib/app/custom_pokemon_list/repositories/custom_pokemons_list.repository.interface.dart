import 'package:commons_dependencies/commons_dependencies.dart';
import '../models/custom_pokemons_list.model.dart';

abstract class ICustomPokemonsListRepository extends Disposable {
  Future<String?> obterPokemons();

  Future<void> updateCustomPokemonsListLocalStorage(
    List<CustomPokemonsListModel> pokemons,
  );
}
