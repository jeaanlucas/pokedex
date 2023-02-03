import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:custom_pokemons/app/custom_pokemon_list/repositories/custom_pokemons_list.repository.dart';
import 'package:custom_pokemons/app/custom_pokemon_list/usecases/custom_pokemons_list.usecase.dart';
import 'package:custom_pokemons/app/custom_pokemon_list/views/custom_pokemons_list.viewmodel.dart';
import 'custom_pokemon_list/views/custom_pokemons_list.view.dart';
import 'new_custom_pokemon/views/new_custom_pokemons.view.dart';
import 'new_custom_pokemon/views/new_custom_pokemons.viewmodel.dart';

class CustomPokemonsModule extends Module {
  static final List<Bind> _viewmodels = [
    Bind<CustomPokemonsListViewModel>((i) => CustomPokemonsListViewModel()),
    Bind<NewCustomPokemonsViewModel>((i) => NewCustomPokemonsViewModel()),
  ];

  static final List<Bind> _usecases = [
    Bind<CustomPokemonsListUseCase>((i) => CustomPokemonsListUseCase()),
  ];

  static final List<Bind> _repositories = [
    Bind<CustomPokemonsListRepository>((i) => CustomPokemonsListRepository()),
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
      child: (_, args) => NewCustomPokemonView(
        pokemonModel: args.data['pokemonModel'],
      ),
    ),
  ];
}
