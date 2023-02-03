import 'package:commons_dependencies/commons_dependencies.dart';

import 'pokemons_details/repositories/pokemons_details.repository.dart';
import 'pokemons_details/usecases/pokemons_details.usecase.dart';
import 'pokemons_details/views/pokemons_details.view.dart';
import 'pokemons_details/views/pokemons_details.viewmodel.dart';
import 'pokemons_list/views/pokemons_list.view.dart';

class PokemonsModule extends Module {
  static final List<Bind> _viewmodels = [
    Bind<PokemonsDetailsViewModel>((i) => PokemonsDetailsViewModel()),
  ];

  static final List<Bind> _usecases = [
    Bind<PokemonsDetailsUseCase>((i) => PokemonsDetailsUseCase()),
  ];

  static final List<Bind> _repositories = [
    Bind<PokemonsDetailsRepository>((i) => PokemonsDetailsRepository()),
  ];

  @override
  final List<Bind> binds = _viewmodels + _usecases + _repositories;

  @override
  final List<ModularRoute> routes = [
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
