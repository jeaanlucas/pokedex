import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../models/custom_pokemons_list.model.dart';
import '../usecases/custom_pokemons_list.usecase.dart';

part 'custom_pokemons_list.viewmodel.g.dart';

class CustomPokemonsListViewModel extends _CustomPokemonsListViewModelBase
    with _$CustomPokemonsListViewModel, Disposable {
  @override
  void dispose() {}
}

abstract class _CustomPokemonsListViewModelBase with Store {
  final CustomPokemonsListUseCase _customPokemonsListUseCase = Modular.get();
  CustomPokemonsListModel? novoPokemon;

  @observable
  List<CustomPokemonsListModel>? pokemonList;

  @observable
  bool loading = false;

  @action
  Future<void> carregarPokemons() async {
    try {
      loading = true;
      pokemonList = await _customPokemonsListUseCase.execute();
      loading = false;
    } catch (e) {
      loading = false;
      rethrow;
    }
  }

  @action
  Future<void> updateCustomPokemons(String url) async {
    try {
      loading = true;
      await _customPokemonsListUseCase.updateCustomPokemons(true, novoPokemon!);
      loading = false;
    } catch (e) {
      loading = false;
      rethrow;
    }
  }

  @action
  Future<void> removeCustomPokemon() async {
    try {
      loading = true;
      await _customPokemonsListUseCase.removeCustomPokemon(pokemonList!);
      loading = false;
    } catch (e) {
      loading = false;
      rethrow;
    }
  }
}
