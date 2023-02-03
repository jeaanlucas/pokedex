import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:custom_pokemons/app/custom_pokemon_list/repositories/custom_pokemons_list.repository.dart';
import 'package:custom_pokemons/app/custom_pokemon_list/usecases/custom_pokemons_list.usecase.dart';
import 'package:custom_pokemons/app/custom_pokemon_list/views/custom_pokemons_list.viewmodel.dart';
import 'package:original_pokemons/app/pokemons_list/repositories/pokemons_list.repository.dart';
import 'package:original_pokemons/app/pokemons_list/usecases/pokemons_list.usecase.dart';
import 'package:original_pokemons/app/pokemons_list/views/pokemons_list.viewmodel.dart';

import 'home/views/home.view.dart';

class HomeModule extends Module {
  static final List<Bind> _viewmodels = [
    Bind<PokemonsListViewModel>((i) => PokemonsListViewModel()),
    Bind<CustomPokemonsListViewModel>((i) => CustomPokemonsListViewModel()),
  ];

  static final List<Bind> _usecases = [
    Bind<PokemonsListUseCase>((i) => PokemonsListUseCase()),
    Bind<CustomPokemonsListUseCase>((i) => CustomPokemonsListUseCase()),
  ];

  static final List<Bind> _repositories = [
    Bind<PokemonsListRepository>((i) => PokemonsListRepository()),
    Bind<CustomPokemonsListRepository>((i) => CustomPokemonsListRepository()),
  ];

  @override
  final List<Bind> binds = _viewmodels + _usecases + _repositories;

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const HomeView(),
    ),
  ];
}
