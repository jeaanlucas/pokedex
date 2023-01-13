import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../models/pokemon_details.model.dart';
import '../usecases/pokemon_details.usecase.dart';

part 'pokemon_details.viewmodel.g.dart';

class PokemonDetailsViewModel extends _PokemonDetailsViewModelBase
    with _$PokemonDetailsViewModel, Disposable {
  @override
  void dispose() {}
}

abstract class _PokemonDetailsViewModelBase with Store {
  final PokemonDetailsUseCase _pokemonDetailsUseCase = Modular.get();
  PokemonDetailsModel? pokemonDetails;

  @observable
  bool loading = false;

  @action
  Future<void> obterDetalhesPokemon(String url) async {
    try {
      loading = true;
      pokemonDetails = await _pokemonDetailsUseCase.execute(url);
      loading = false;
    } catch (e) {
      loading = false;
      rethrow;
    }
  }
}
