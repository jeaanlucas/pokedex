// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemons_details.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonsDetailsViewModel on _PokemonsDetailsViewModelBase, Store {
  late final _$loadingAtom =
      Atom(name: '_PokemonsDetailsViewModelBase.loading', context: context);

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

  late final _$obterDetalhesPokemonAsyncAction = AsyncAction(
      '_PokemonsDetailsViewModelBase.obterDetalhesPokemon',
      context: context);

  @override
  Future<void> obterDetalhesPokemon(String url) {
    return _$obterDetalhesPokemonAsyncAction
        .run(() => super.obterDetalhesPokemon(url));
  }

  late final _$_PokemonsDetailsViewModelBaseActionController =
      ActionController(name: '_PokemonsDetailsViewModelBase', context: context);

  @override
  Color corDeAcordoComOTipo(String type) {
    final _$actionInfo = _$_PokemonsDetailsViewModelBaseActionController
        .startAction(name: '_PokemonsDetailsViewModelBase.corDeAcordoComOTipo');
    try {
      return super.corDeAcordoComOTipo(type);
    } finally {
      _$_PokemonsDetailsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
