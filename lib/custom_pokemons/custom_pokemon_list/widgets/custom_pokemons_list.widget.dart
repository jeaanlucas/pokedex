import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../models/custom_pokemons_abilities.model.dart';
import '../models/custom_pokemons_list.model.dart';
import '../views/custom_pokemons_list.viewmodel.dart';

class CustomPokemonsListWidget extends StatelessWidget {
  const CustomPokemonsListWidget({
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  final CustomPokemonsListViewModel viewModel;

  String _montaListaHabilidades(List<CustomPokemonsAbilitiesModel> abilities) {
    if (abilities.isEmpty) {
      return 'No abilities learned';
    }

    String formatedAbilities = '';
    for (dynamic ability in abilities) {
      formatedAbilities += '${ability.name.capitalize()}, ';
    }

    return formatedAbilities.substring(0, formatedAbilities.length - 2);
  }

  void _remove(int index) async {
    viewModel.pokemonList!.removeAt(index);
    viewModel.removeCustomPokemon();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => viewModel.pokemonList == null
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
            : Flexible(
                child: ListView.separated(
                  itemCount: viewModel.pokemonList!.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    CustomPokemonsListModel pokemon =
                        viewModel.pokemonList![index];

                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pokemon.name,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                _montaListaHabilidades(pokemon.abilities),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                tooltip: 'Edit ${pokemon.name}',
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
                                tooltip: 'Remove ${pokemon.name}',
                                onPressed: () => _remove(index),
                                icon: const Icon(
                                  Icons.person_remove_alt_1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
      );
}
