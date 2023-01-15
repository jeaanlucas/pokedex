import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../custom_pokemons/custom_pokemon_list/repositories/custom_pokemons_list.repository.dart';
import '../custom_pokemons/custom_pokemon_list/usecases/custom_pokemons_list.usecase.dart';
import '../custom_pokemons/custom_pokemon_list/views/custom_pokemons_list.viewmodel.dart';
import '../custom_pokemons/custom_pokemons.module.dart';
import '../home/views/home.view.dart';
import '../pokemons/pokemons.module.dart';
import '../pokemons/pokemons_list/repositories/pokemons_list.repository.dart';
import '../pokemons/pokemons_list/usecases/pokemons_list.usecase.dart';
import '../pokemons/pokemons_list/views/pokemons_list.viewmodel.dart';
import '../utils/image_picker.service.dart';
import '../utils/local_data.repository.dart';

class AppModule extends Module {
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
    Bind<LocalDataRepository>((i) => LocalDataRepository()),
  ];

  static final List<Bind> _services = [
    Bind.factory<Dio>((i) => Dio()),
    Bind.factory<ImagePickerService>((i) => ImagePickerService()),
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
