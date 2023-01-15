import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../../utils/extensions/string.extension.dart';
import '../../../utils/image_picker.service.dart';
import '../../custom_pokemon_list/models/custom_pokemons_abilities.model.dart';
import '../../custom_pokemon_list/models/custom_pokemons_list.model.dart';
import '../../custom_pokemon_list/views/custom_pokemons_list.viewmodel.dart';

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
  final CustomPokemonsListViewModel _viewModel = Modular.get();
  final ImagePickerService _imagePickerService = Modular.get();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final List<CustomPokemonsAbilitiesModel> _abilities = [];
  XFile? _pickedFile;

  @override
  void initState() {
    _initScreen();
    super.initState();
  }

  void _initScreen() {
    if (widget.pokemonModel != null) {
      _nameController.text = widget.pokemonModel!.name;
      _pickedFile = XFile(widget.pokemonModel!.pathImage);
    }
  }

  void _savePokemonInDevice() {
    if (_formKey.currentState!.validate()) {
      _viewModel.novoPokemon = CustomPokemonsListModel(
        uuid: widget.pokemonModel?.uuid ?? const Uuid().v1(),
        pathImage: _pickedFile != null ? _pickedFile!.path : '',
        name: _nameController.text,
        abilities: _abilities,
      );

      _viewModel.updateCustomPokemons(widget.pokemonModel != null);
      Modular.to.pop();
    }
  }

  void _getFromGallery() async {
    _pickedFile = await _imagePickerService.pickImageFromGallery();
    setState(() {});
  }

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
              Row(
                children: [
                  _pickedFile == null
                      ? Container(
                          color: Colors.greenAccent,
                          child: InkWell(
                            onTap: () => _getFromGallery(),
                            child: const Text('Pokémon image'),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.file(
                            File(_pickedFile!.path),
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                  _GenericFormField(
                    controller: _nameController,
                    label: 'Name',
                    flex: 2,
                    isRequired: true,
                  ),
                ],
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

class _GenericFormField extends StatelessWidget {
  const _GenericFormField({
    required this.label,
    required this.flex,
    required this.controller,
    this.isRequired = false,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final int flex;
  final bool isRequired;

  @override
  Widget build(BuildContext context) => Flexible(
        flex: flex,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: label,
            ),
            validator: (value) {
              if (isRequired) {
                return value == null || value.isEmpty
                    ? 'Please, fill the $label field'
                    : null;
              }

              return null;
            },
          ),
        ),
      );
}
