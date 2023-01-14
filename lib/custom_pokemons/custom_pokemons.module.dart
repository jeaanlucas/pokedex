import 'package:flutter_modular/flutter_modular.dart';
import 'custom_pokemon_list/views/custom_pokemons_list.view.dart';
import 'new_custom_pokemon/views/new_custom_pokemons.view.dart';

class CustomPokemonsModule extends Module {
  static final List<Bind> _viewmodels = [
    // Bind<PokemonsListViewModel>((i) => PokemonsListViewModel()),
  ];

  static final List<Bind> _usecases = [
    // Bind<PokemonsListUseCase>((i) => PokemonsListUseCase()),
  ];

  static final List<Bind> _repositories = [
    // Bind<PokemonsListRepository>((i) => PokemonsListRepository()),
  ];

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
      child: (_, args) => const NewCustomPokemonView(),
    ),
  ];
}
