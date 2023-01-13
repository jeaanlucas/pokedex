import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../model/pokemon_list.model.dart';
import '../usecase/pokemon_list.usecase.dart';

part 'pokemon_list.viewmodel.g.dart';

class PokemonListViewModel extends _PokemonListViewModelBase
    with _$PokemonListViewModel, Disposable {
  @override
  void dispose() {}
}

abstract class _PokemonListViewModelBase with Store {
  final PokemonListUseCase _pokemonListUseCase = Modular.get();
  PokemonListModel? pokemonList;

  @observable
  bool loadingpokemons = false;

  @action
  Future<void> carregarPokemons(String url) async {
    try {
      loadingpokemons = true;
      pokemonList = await _pokemonListUseCase.execute(
        url,
      );
      loadingpokemons = false;
    } catch (e) {
      loadingpokemons = false;
      rethrow;
    }
  }
}
