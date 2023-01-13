import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:poke_dex/pokemon_list/models/pokemon_list.model.dart';
import 'package:poke_dex/pokemon_list/usecases/pokemon_list.usecase.dart';

part 'pokemon_details.viewmodel.g.dart';

class PokemonDetailsViewModel extends _PokemonDetailsViewModelBase
    with _$PokemonDetailsViewModel, Disposable {
  @override
  void dispose() {}
}

abstract class _PokemonDetailsViewModelBase with Store {
  final PokemonListUseCase _pokemonListUseCase = Modular.get();
  PokemonListModel? pokemonList;

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
