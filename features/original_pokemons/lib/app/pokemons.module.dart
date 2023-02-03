import 'package:original_pokemons/app/pokemons_details/repositories/pokemons_details.repository.dart';
import 'package:original_pokemons/app/pokemons_details/usecases/pokemons_details.usecase.dart';
import 'package:original_pokemons/app/pokemons_details/views/pokemons_details.view.dart';
import 'package:original_pokemons/app/pokemons_details/views/pokemons_details.viewmodel.dart';
import 'package:original_pokemons/app/pokemons_list/repositories/pokemons_list.repository.dart';
import 'package:original_pokemons/app/pokemons_list/usecases/pokemons_list.usecase.dart';
import 'package:original_pokemons/app/pokemons_list/views/pokemons_list.view.dart';
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:original_pokemons/app/pokemons_list/views/pokemons_list.viewmodel.dart';

class PokemonsModule extends Module {
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
