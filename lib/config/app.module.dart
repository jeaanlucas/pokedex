import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_dex/pokemon_details/repositories/pokemon_details.repository.dart';
import 'package:poke_dex/pokemon_details/usecases/pokemon_details.usecase.dart';
import 'package:poke_dex/pokemon_details/views/pokemon_details.view.dart';
import 'package:poke_dex/pokemon_details/views/pokemon_details.viewmodel.dart';
import 'package:poke_dex/pokemon_list/repositories/pokemon_list.repository.dart';
import 'package:poke_dex/pokemon_list/usecases/pokemon_list.usecase.dart';
import 'package:poke_dex/pokemon_list/views/pokemon_list.view.dart';
import 'package:poke_dex/pokemon_list/views/pokemon_list.viewmodel.dart';

class AppModule extends Module {
  static final List<Bind> _viewmodels = [
    Bind<PokemonListViewModel>((i) => PokemonListViewModel()),
    Bind<PokemonDetailsViewModel>((i) => PokemonDetailsViewModel()),
  ];

  static final List<Bind> _usecases = [
    Bind<PokemonListUseCase>((i) => PokemonListUseCase()),
    Bind<PokemonDetailsUseCase>((i) => PokemonDetailsUseCase()),
  ];

  static final List<Bind> _repositories = [
    Bind<PokemonListRepository>((i) => PokemonListRepository()),
    Bind<PokemonDetailsRepository>((i) => PokemonDetailsRepository()),
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
      child: (_, args) => const PokemonListView(),
    ),
    ChildRoute(
      '/detalhes-pokemon',
      child: (_, args) => PokemonDetailsView(
        urlDetalhes: args.data['urlDetalhes'],
      ),
    ),
  ];
}
