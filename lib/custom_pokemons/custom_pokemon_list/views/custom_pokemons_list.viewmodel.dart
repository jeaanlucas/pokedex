// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
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
  ObservableList<CustomPokemonsListModel>? pokemonList;
  @observable
  bool loading = false;
  @observable
  XFile? pickedFile;
  @observable
  bool showAbilityTwo = false;
  @observable
  bool showAbilityThree = false;

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
  Future<void> updateCustomPokemons(bool atualizarPokemon) async {
    try {
      loading = true;
      await _customPokemonsListUseCase.updateCustomPokemons(atualizarPokemon, novoPokemon!);
      novoPokemon = null;
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
