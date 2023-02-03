import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:custom_pokemons/custom_pokemons.dart';
import 'package:home_pokemons/app/home.module.dart';
import 'package:original_pokemons/original_pokemons.dart';

class AppModule extends Module {
  static final List<Bind> _repositories = [
    Bind<LocalDataRepository>((i) => LocalDataRepository()),
  ];

  static final List<Bind> _services = [
    Bind.factory<Dio>((i) => Dio()),
    Bind.factory<ImagePickerService>((i) => ImagePickerService()),
  ];

  @override
  final List<Bind> binds = _repositories + _services;

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      Modular.initialRoute,
      module: HomeModule(),
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
