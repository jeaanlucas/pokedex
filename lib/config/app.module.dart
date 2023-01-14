import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../home/views/home.view.dart';
import '../pokemons/pokemons_details/repositories/pokemons_details.repository.dart';
import '../pokemons/pokemons_details/usecases/pokemons_details.usecase.dart';
import '../pokemons/pokemons_details/views/pokemons_details.view.dart';
import '../pokemons/pokemons_details/views/pokemons_details.viewmodel.dart';
import '../pokemons/pokemons_list/repositories/pokemons_list.repository.dart';
import '../pokemons/pokemons_list/usecases/pokemons_list.usecase.dart';
import '../pokemons/pokemons_list/views/pokemons_list.view.dart';
import '../pokemons/pokemons_list/views/pokemons_list.viewmodel.dart';

class AppModule extends Module {
  static final List<Bind> _viewmodels = [
    Bind<PokemonsListViewModel>((i) => PokemonsListViewModel()),
    Bind<PokemonsDetailsViewModel>((i) => PokemonsDetailsViewModel()),
  ];

  static final List<Bind> _usecases = [
    Bind<PokemonsListUseCase>((i) => PokemonsListUseCase()),
    Bind<PokemonsDetailsUseCase>((i) => PokemonsDetailsUseCase()),
  ];

  static final List<Bind> _repositories = [
    Bind<PokemonsListRepository>((i) => PokemonsListRepository()),
    Bind<PokemonsDetailsRepository>((i) => PokemonsDetailsRepository()),
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
    ChildRoute(
      '/list',
      child: (_, args) => const PokemonsListView(),
    ),
    ChildRoute(
      '/detalhes',
      child: (_, args) => PokemonsDetailsView(
        urlDetalhes: args.data['urlDetalhes'],
        nomePokemon: args.data['nomePokemon'],
      ),
    ),
  ];
}
