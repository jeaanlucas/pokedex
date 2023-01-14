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
  List<CustomPokemonsListModel>? get pokemonList {
    _$pokemonListAtom.reportRead();
    return super.pokemonList;
  }

  @override
  set pokemonList(List<CustomPokemonsListModel>? value) {
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
  Future<void> updateCustomPokemons(String url) {
    return _$updateCustomPokemonsAsyncAction
        .run(() => super.updateCustomPokemons(url));
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
loading: ${loading}
    ''';
  }
}
