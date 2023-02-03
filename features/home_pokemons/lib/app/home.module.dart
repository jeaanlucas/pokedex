import 'package:home_pokemons/app/home/views/home.view.dart';
import 'package:commons_dependencies/commons_dependencies.dart';

class HomeModule extends Module {
  static final List<Bind> _viewmodels = [];

  static final List<Bind> _usecases = [];

  static final List<Bind> _repositories = [];

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
