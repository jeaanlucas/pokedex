// ignore_for_file: depend_on_referenced_packages
import 'package:mobx/mobx.dart';

import 'package:commons_dependencies/commons_dependencies.dart';
import '../../custom_pokemon_list/models/custom_pokemons_abilities.model.dart';
import '../../custom_pokemon_list/models/custom_pokemons_list.model.dart';
import '../../custom_pokemon_list/usecases/custom_pokemons_list.usecase.dart';

part 'new_custom_pokemons.viewmodel.g.dart';

class NewCustomPokemonsViewModel extends _NewCustomPokemonsViewModelBase
    with _$NewCustomPokemonsViewModel, Disposable {
  @override
  void dispose() {}
}

abstract class _NewCustomPokemonsViewModelBase with Store {
  final CustomPokemonsListUseCase _customPokemonsListUseCase = Modular.get();
  final ImagePickerService _imagePickerService = Modular.get();
  CustomPokemonsListModel? novoPokemon;

  @observable
  XFile? pickedFile;
  @observable
  bool showAbilityTwo = false;
  @observable
  bool showAbilityThree = false;
  @observable
  List<CustomPokemonsAbilitiesModel> abilities = [];

  @action
  Future<void> updateCustomPokemons(bool atualizarPokemon) async {
    try {
      await _customPokemonsListUseCase.updateCustomPokemons(
          atualizarPokemon, novoPokemon!);
      novoPokemon = null;
    } catch (e) {
      rethrow;
    }
  }

  @action
  void pickImage() async {
    pickedFile = await _imagePickerService.pickImageFromGallery();
  }
}
