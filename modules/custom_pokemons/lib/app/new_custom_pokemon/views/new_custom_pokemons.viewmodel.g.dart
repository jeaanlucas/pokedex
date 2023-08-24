// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_custom_pokemons.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewCustomPokemonsViewModel on _NewCustomPokemonsViewModelBase, Store {
  late final _$pickedFileAtom = Atom(
      name: '_NewCustomPokemonsViewModelBase.pickedFile', context: context);

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
      name: '_NewCustomPokemonsViewModelBase.showAbilityTwo', context: context);

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
      name: '_NewCustomPokemonsViewModelBase.showAbilityThree',
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

  late final _$abilitiesAtom =
      Atom(name: '_NewCustomPokemonsViewModelBase.abilities', context: context);

  @override
  List<CustomPokemonsAbilitiesModel> get abilities {
    _$abilitiesAtom.reportRead();
    return super.abilities;
  }

  @override
  set abilities(List<CustomPokemonsAbilitiesModel> value) {
    _$abilitiesAtom.reportWrite(value, super.abilities, () {
      super.abilities = value;
    });
  }

  late final _$updateCustomPokemonsAsyncAction = AsyncAction(
      '_NewCustomPokemonsViewModelBase.updateCustomPokemons',
      context: context);

  @override
  Future<void> updateCustomPokemons(bool atualizarPokemon) {
    return _$updateCustomPokemonsAsyncAction
        .run(() => super.updateCustomPokemons(atualizarPokemon));
  }

  late final _$pickImageAsyncAction = AsyncAction(
      '_NewCustomPokemonsViewModelBase.pickImage',
      context: context);

  @override
  Future<void> pickImage() {
    return _$pickImageAsyncAction.run(() => super.pickImage());
  }

  @override
  String toString() {
    return '''
pickedFile: ${pickedFile},
showAbilityTwo: ${showAbilityTwo},
showAbilityThree: ${showAbilityThree},
abilities: ${abilities}
    ''';
  }
}
