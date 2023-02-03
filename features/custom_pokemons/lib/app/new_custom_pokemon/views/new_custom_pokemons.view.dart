import 'dart:io';

import 'package:flutter/material.dart';

import 'package:commons_dependencies/commons_dependencies.dart';
import '../../custom_pokemon_list/models/custom_pokemons_abilities.model.dart';
import '../../custom_pokemon_list/models/custom_pokemons_list.model.dart';
import '../widgets/ability_line.widget.dart';
import '../widgets/generic_form_field.widget.dart';
import 'new_custom_pokemons.viewmodel.dart';

class NewCustomPokemonView extends StatefulWidget {
  const NewCustomPokemonView({
    this.pokemonModel,
    Key? key,
  }) : super(key: key);

  final CustomPokemonsListModel? pokemonModel;

  @override
  State<NewCustomPokemonView> createState() => _NewCustomPokemonViewState();
}

class _NewCustomPokemonViewState extends State<NewCustomPokemonView> {
  final NewCustomPokemonsViewModel _viewModel = Modular.get();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _abilityOneController = TextEditingController();
  final TextEditingController _abilityTwoController = TextEditingController();
  final TextEditingController _abilityThreeController = TextEditingController();

  @override
  void initState() {
    _initScreen();
    super.initState();
  }

  void _initScreen() {
    _viewModel.abilities.clear();
    _viewModel.pickedFile = null;
    _viewModel.showAbilityTwo = false;
    _viewModel.showAbilityThree = false;

    if (widget.pokemonModel != null) {
      _viewModel.pickedFile = XFile(widget.pokemonModel!.pathImage);
      _nameController.text = widget.pokemonModel!.name;
      _abilityOneController.text = widget.pokemonModel!.abilities[0].name;

      if (_checkIfIndexExists(1) &&
          widget.pokemonModel!.abilities[1].name.isNotEmpty) {
        _abilityTwoController.text = widget.pokemonModel!.abilities[1].name;
        _viewModel.showAbilityTwo = true;
      }

      if (_checkIfIndexExists(2) &&
          widget.pokemonModel!.abilities[2].name.isNotEmpty) {
        _abilityThreeController.text = widget.pokemonModel!.abilities[2].name;
        _viewModel.showAbilityThree = true;
      }
    }
  }

  void _savePokemonInDevice() {
    if (_viewModel.pickedFile == null) {
      _dialogInformeUmaImagem(context);
      return;
    }

    if (_formKey.currentState!.validate()) {
      _fillAbilities();

      _viewModel.novoPokemon = CustomPokemonsListModel(
        uuid: widget.pokemonModel?.uuid ?? const Uuid().v1(),
        pathImage:
            _viewModel.pickedFile != null ? _viewModel.pickedFile!.path : '',
        name: _nameController.text,
        abilities: _viewModel.abilities,
      );

      _viewModel.updateCustomPokemons(widget.pokemonModel != null);
      Modular.to.pop();
    }
  }

  void _fillAbilities() {
    _viewModel.abilities.add(
      CustomPokemonsAbilitiesModel(
        uuid: widget.pokemonModel?.abilities[0].uuid ?? const Uuid().v1(),
        name: _abilityOneController.text,
      ),
    );

    if (_abilityTwoController.text.isNotEmpty) {
      _viewModel.abilities.add(
        CustomPokemonsAbilitiesModel(
          uuid: _checkIfIndexExists(1)
              ? widget.pokemonModel?.abilities[1].uuid ?? const Uuid().v1()
              : const Uuid().v1(),
          name: _abilityTwoController.text,
        ),
      );
    }

    if (_abilityThreeController.text.isNotEmpty) {
      _viewModel.abilities.add(
        CustomPokemonsAbilitiesModel(
          uuid: _checkIfIndexExists(2)
              ? widget.pokemonModel?.abilities[2].uuid ?? const Uuid().v1()
              : const Uuid().v1(),
          name: _abilityThreeController.text,
        ),
      );
    }
  }

  bool _checkIfIndexExists(int index) {
    if (widget.pokemonModel != null) {
      return widget.pokemonModel!.abilities.asMap().containsKey(index);
    }

    return false;
  }

  Future<void> _dialogInformeUmaImagem(BuildContext context) =>
      showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(
            'Please, inform an image',
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'Ok',
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            widget.pokemonModel != null
                ? 'Editing ${widget.pokemonModel?.name.toString().capitalize()}'
                : 'Creating a new custom Pokémon',
          ),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Observer(
                      builder: (_) => _viewModel.pickedFile == null
                          ? Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.redAccent,
                              ),
                              child: InkWell(
                                onTap: () => _viewModel.pickImage(),
                                child: const Text(
                                  'Select image',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () => _viewModel.pickImage(),
                              child: Image.file(
                                File(_viewModel.pickedFile!.path),
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GenericFormFieldWidget(
                      controller: _nameController,
                      label: 'Pokémon Name',
                      flex: 2,
                      isRequired: true,
                    ),
                  ],
                ),
              ),
              AbilityLineWidget(
                controller: _abilityOneController,
                onPressed: () {
                  setState(() {
                    _viewModel.showAbilityTwo = true;
                  });
                },
                label: 'Ability 1',
                isRequired: true,
              ),
              Visibility(
                visible: _viewModel.showAbilityTwo,
                child: AbilityLineWidget(
                  controller: _abilityTwoController,
                  onPressed: () {
                    setState(() {
                      _viewModel.showAbilityThree = true;
                    });
                  },
                  label: 'Ability 2',
                ),
              ),
              Visibility(
                visible: _viewModel.showAbilityThree,
                child: AbilityLineWidget(
                  controller: _abilityThreeController,
                  onPressed: () {},
                  label: 'Ability 3',
                  showAddIcon: false,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _savePokemonInDevice(),
          tooltip: 'Save Pokémon',
          child: const Icon(
            Icons.save,
          ),
        ),
      );
}
