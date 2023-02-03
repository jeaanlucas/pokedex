// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_pokemons_list.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomPokemonsListViewModel on _CustomPokemonsListViewModelBase, Store {
  late final _$pokemonListAtom = Atom(
      name: '_CustomPokemonsListViewModelBase.pokemonList', context: context);

  @override
  ObservableList<CustomPokemonsListModel>? get pokemonList {
    _$pokemonListAtom.reportRead();
    return super.pokemonList;
  }

  @override
  set pokemonList(ObservableList<CustomPokemonsListModel>? value) {
    _$pokemonListAtom.reportWrite(value, super.pokemonList, () {
      super.pokemonList = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_CustomPokemonsListViewModelBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$pickedFileAtom = Atom(
      name: '_CustomPokemonsListViewModelBase.pickedFile', context: context);

  @override
  XFile? get pickedFile {
    _$pickedFileAtom.reportRead();
    return super.pickedFile;
  }

  @override
  set pickedFile(XFile? value) {
    _$pickedFileAtom.reportWrite(value, super.pickedFile, () {
      super.pickedFile = value;
    });
  }

  late final _$showAbilityTwoAtom = Atom(
      name: '_CustomPokemonsListViewModelBase.showAbilityTwo',
      context: context);

  @override
  bool get showAbilityTwo {
    _$showAbilityTwoAtom.reportRead();
    return super.showAbilityTwo;
  }

  @override
  set showAbilityTwo(bool value) {
    _$showAbilityTwoAtom.reportWrite(value, super.showAbilityTwo, () {
      super.showAbilityTwo = value;
    });
  }

  late final _$showAbilityThreeAtom = Atom(
      name: '_CustomPokemonsListViewModelBase.showAbilityThree',
      context: context);

  @override
  bool get showAbilityThree {
    _$showAbilityThreeAtom.reportRead();
    return super.showAbilityThree;
  }

  @override
  set showAbilityThree(bool value) {
    _$showAbilityThreeAtom.reportWrite(value, super.showAbilityThree, () {
      super.showAbilityThree = value;
    });
  }

  late final _$carregarPokemonsAsyncAction = AsyncAction(
      '_CustomPokemonsListViewModelBase.carregarPokemons',
      context: context);

  @override
  Future<void> carregarPokemons() {
    return _$carregarPokemonsAsyncAction.run(() => super.carregarPokemons());
  }

  late final _$updateCustomPokemonsAsyncAction = AsyncAction(
      '_CustomPokemonsListViewModelBase.updateCustomPokemons',
      context: context);

  @override
  Future<void> updateCustomPokemons(bool atualizarPokemon) {
    return _$updateCustomPokemonsAsyncAction
        .run(() => super.updateCustomPokemons(atualizarPokemon));
  }

  late final _$removeCustomPokemonAsyncAction = AsyncAction(
      '_CustomPokemonsListViewModelBase.removeCustomPokemon',
      context: context);

  @override
  Future<void> removeCustomPokemon() {
    return _$removeCustomPokemonAsyncAction
        .run(() => super.removeCustomPokemon());
  }

  @override
  String toString() {
    return '''
pokemonList: ${pokemonList},
loading: ${loading},
pickedFile: ${pickedFile},
showAbilityTwo: ${showAbilityTwo},
showAbilityThree: ${showAbilityThree}
    ''';
  }
}
