import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';

import '../views/pokemons_details.viewmodel.dart';

class PokemonsPicturesWidget extends StatelessWidget {
  const PokemonsPicturesWidget({
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  final PokemonsDetailsViewModel viewModel;

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => viewModel.loading
            ? const SizedBox()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    viewModel.pokemonDetails!.frontSpriteDefault,
                  ),
                  Image.network(
                    viewModel.pokemonDetails!.backSpriteDefault,
                  ),
                ],
              ),
      );
}
