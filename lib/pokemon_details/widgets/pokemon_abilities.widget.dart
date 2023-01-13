import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../utils/extensions/string.extension.dart';
import '../models/abilities.model.dart';
import '../views/pokemon_details.viewmodel.dart';

class PokemonAbilitiesWidget extends StatelessWidget {
  const PokemonAbilitiesWidget({
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  final PokemonDetailsViewModel viewModel;

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
