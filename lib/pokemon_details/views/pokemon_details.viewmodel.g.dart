// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_details.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonDetailsViewModel on _PokemonDetailsViewModelBase, Store {
  late final _$loadingAtom =
      Atom(name: '_PokemonDetailsViewModelBase.loading', context: context);

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
      '_PokemonDetailsViewModelBase.obterDetalhesPokemon',
      context: context);

  @override
  Future<void> obterDetalhesPokemon(String url) {
    return _$obterDetalhesPokemonAsyncAction
        .run(() => super.obterDetalhesPokemon(url));
  }

  late final _$_PokemonDetailsViewModelBaseActionController =
      ActionController(name: '_PokemonDetailsViewModelBase', context: context);

  @override
  Color corDeAcordoComOTipo(String type) {
    final _$actionInfo = _$_PokemonDetailsViewModelBaseActionController
        .startAction(name: '_PokemonDetailsViewModelBase.corDeAcordoComOTipo');
    try {
      return super.corDeAcordoComOTipo(type);
    } finally {
      _$_PokemonDetailsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}