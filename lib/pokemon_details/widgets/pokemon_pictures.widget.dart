import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../views/pokemon_details.viewmodel.dart';

class PokemonPicturesWidget extends StatelessWidget {
  const PokemonPicturesWidget({
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  final PokemonDetailsViewModel viewModel;

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
