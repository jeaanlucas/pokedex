import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../custom_pokemons/custom_pokemons.module.dart';
import '../home/views/home.view.dart';
import '../pokemons/pokemons.module.dart';
import '../pokemons/pokemons_list/repositories/pokemons_list.repository.dart';
import '../pokemons/pokemons_list/usecases/pokemons_list.usecase.dart';
import '../pokemons/pokemons_list/views/pokemons_list.viewmodel.dart';
import '../utils/local_data.repository.dart';

class AppModule extends Module {
  static final List<Bind> _viewmodels = [
    Bind<PokemonsListViewModel>((i) => PokemonsListViewModel()),
  ];

  static final List<Bind> _usecases = [
    Bind<PokemonsListUseCase>((i) => PokemonsListUseCase()),
  ];

  static final List<Bind> _repositories = [
    Bind<PokemonsListRepository>((i) => PokemonsListRepository()),
    Bind<LocalDataRepository>((i) => LocalDataRepository()),
  ];

  static final List<Bind> _services = [
    Bind.factory<Dio>((i) => Dio()),
  ];

  @override
  final List<Bind> binds = _viewmodels + _usecases + _repositories + _services;

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const HomeView(),
    ),
    ModuleRoute(
      '/pokemons',
      module: PokemonsModule(),
    ),
    ModuleRoute(
      '/custom-pokemons',
      module: CustomPokemonsModule(),
    ),
  ];
}
