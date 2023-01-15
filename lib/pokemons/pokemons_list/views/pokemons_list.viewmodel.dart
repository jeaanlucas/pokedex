// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../models/pokemons_list.model.dart';
import '../usecases/pokemons_list.usecase.dart';

part 'pokemons_list.viewmodel.g.dart';

class PokemonsListViewModel extends _PokemonsListViewModelBase
    with _$PokemonsListViewModel, Disposable {
  @override
  void dispose() {}
}

abstract class _PokemonsListViewModelBase with Store {
  final PokemonsListUseCase _pokemonListUseCase = Modular.get();
  PokemonsListModel? pokemonList;

  @observable
  bool loading = false;

  @action
  Future<void> carregarPokemons(String url) async {
    try {
      loading = true;
      pokemonList = await _pokemonListUseCase.execute(url);
      loading = false;
    } catch (e) {
      loading = false;
      rethrow;
    }
  }
}
