import 'package:commons_dependencies/commons_dependencies.dart';
import 'custom_pokemon_list/views/custom_pokemons_list.view.dart';
import 'new_custom_pokemon/views/new_custom_pokemons.view.dart';
import 'new_custom_pokemon/views/new_custom_pokemons.viewmodel.dart';

class CustomPokemonsModule extends Module {
  static final List<Bind> _viewmodels = [
    Bind<NewCustomPokemonsViewModel>((i) => NewCustomPokemonsViewModel()),
  ];

  static final List<Bind> _usecases = [];

  static final List<Bind> _repositories = [];

  @override
  final List<Bind> binds = _viewmodels + _usecases + _repositories;

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/list',
      child: (_, args) => const CustomPokemonListView(),
    ),
    ChildRoute(
      '/new',
      child: (_, args) => NewCustomPokemonView(
        pokemonModel: args.data['pokemonModel'],
      ),
    ),
  ];
}
