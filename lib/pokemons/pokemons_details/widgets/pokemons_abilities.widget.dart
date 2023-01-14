import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../utils/extensions/string.extension.dart';
import '../models/abilities.model.dart';
import '../views/pokemons_details.viewmodel.dart';

class PokemonsAbilitiesWidget extends StatelessWidget {
  const PokemonsAbilitiesWidget({
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  final PokemonsDetailsViewModel viewModel;

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => viewModel.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Flexible(
                child: ListView.builder(
                  itemCount: viewModel.pokemonDetails!.abilities!.length,
                  itemBuilder: (BuildContext context, int index) {
                    AbilitiesModel ability =
                        viewModel.pokemonDetails!.abilities![index].ability;

                    return Column(
                      children: [
                        ListTile(
                          title: Center(
                            child: Text(
                              ability.name.capitalize(),
                              style: TextStyle(
                                fontSize: 18.0,
                                color: viewModel.abilitiesColors[index],
                              ),
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
