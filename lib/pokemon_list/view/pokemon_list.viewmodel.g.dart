// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonListViewModel on _PokemonListViewModelBase, Store {
  late final _$loadingpokemonsAtom =
      Atom(name: '_PokemonListViewModelBase.loadingpokemons', context: context);

  @override
  bool get loadingpokemons {
    _$loadingpokemonsAtom.reportRead();
    return super.loadingpokemons;
  }

  @override
  set loadingpokemons(bool value) {
    _$loadingpokemonsAtom.reportWrite(value, super.loadingpokemons, () {
      super.loadingpokemons = value;
    });
  }

  late final _$carregarPokemonsAsyncAction = AsyncAction(
      '_PokemonListViewModelBase.carregarPokemons',
      context: context);

  @override
  Future<void> carregarPokemons(String url) {
    return _$carregarPokemonsAsyncAction.run(() => super.carregarPokemons(url));
  }

  @override
  String toString() {
    return '''
loadingpokemons: ${loadingpokemons}
    ''';
  }
}