import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../utils/extensions/string.extension.dart';
import '../models/custom_pokemons_abilities.model.dart';
import '../models/custom_pokemons_list.model.dart';
import '../views/custom_pokemons_list.viewmodel.dart';

class CustomPokemonsListWidget extends StatefulWidget {
  const CustomPokemonsListWidget({
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  final CustomPokemonsListViewModel viewModel;

  @override
  State<CustomPokemonsListWidget> createState() =>
      _CustomPokemonsListWidgetState();
}

class _CustomPokemonsListWidgetState extends State<CustomPokemonsListWidget> {
  String _montaListaHabilidades(List<CustomPokemonsAbilitiesModel> abilities) {
    if (abilities.isEmpty) {
      return 'No abilities learned';
    }

    String formatedAbilities = '';
    for (dynamic ability in abilities) {
      formatedAbilities += '${ability.name}, '.capitalize();
    }

    return formatedAbilities.substring(0, formatedAbilities.length - 2);
  }

  void _removePokemonFromList(int index) async {
    setState(() {
      widget.viewModel.pokemonList!.removeAt(index);
    });

    widget.viewModel.removeCustomPokemon();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => widget.viewModel.pokemonList == null
            ? const Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "You don't have created any Pokémons yet!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              )
            : Expanded(
                child: ListView.separated(
                  itemCount: widget.viewModel.pokemonList!.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    CustomPokemonsListModel pokemon =
                        widget.viewModel.pokemonList![index];
                    String pokemonName = pokemon.name.capitalize();

                    return Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                            ),
                            child: Image.file(
                              File(pokemon.pathImage),
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pokemonName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                _montaListaHabilidades(pokemon.abilities),
                                style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14.0,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  tooltip: 'Edit $pokemonName',
                                  onPressed: () => Modular.to.pushNamed(
                                    '/custom-pokemons/new',
                                    arguments: {
                                      'pokemonModel': pokemon,
                                    },
                                  ),
                                  icon: const Icon(
                                    Icons.edit,
                                  ),
                                ),
                                IconButton(
                                  tooltip: 'Remove $pokemonName',
                                  onPressed: () =>
                                      _removePokemonFromList(index),
                                  icon: const Icon(
                                    Icons.remove_circle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
      );
}
