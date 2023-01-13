import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_dex/pokemon_list/repository/pokemon_list.repository.dart';
import 'package:poke_dex/pokemon_list/usecase/pokemon_list.usecase.dart';
import 'package:poke_dex/pokemon_list/view/pokemon_list.view.dart';
import 'package:poke_dex/pokemon_list/view/pokemon_list.viewmodel.dart';

class AppModule extends Module {
  static final List<Bind> _viewmodels = [
    Bind<PokemonListViewModel>((i) => PokemonListViewModel()),
  ];

  static final List<Bind> _usecases = [
    Bind<PokemonListUseCase>((i) => PokemonListUseCase()),
  ];

  static final List<Bind> _repositories = [
    Bind<PokemonListRepository>((i) => PokemonListRepository()),
  ];

  static final List<Bind> _services = [
    Bind.factory<Dio>((i) => Dio()),
  ];

  @override
  final List<Bind> binds = _viewmodels + _usecases + _repositories + _services;

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => PokemonListView()),
    // ChildRoute('/onboarding', child: (_, args) => const OnBoardingView()),
    // ModuleRoute('/root', module: RootModule()),
    // ModuleRoute('/escolha-fluxo', module: EscolhaFluxoModule()),
    // ModuleRoute('/login', module: LoginModule()),
    // ModuleRoute('/webview', module: WebviewModule()),
  ];
}
