import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poke_dex/pokemon_list/views/pokemon_list.viewmodel.dart';

class PokemonNavigator extends StatelessWidget {
  final PokemonListViewModel viewModel;

  const PokemonNavigator({
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => viewModel.loading
          ? const SizedBox()
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: viewModel.pokemonList!.previous != null
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  onPressed: viewModel.pokemonList!.previous != null
                      ? () => viewModel
                          .carregarPokemons(viewModel.pokemonList!.previous!)
                      : null,
                ),
                const Text(
                  'NAVEGAÇÃO',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    color: viewModel.pokemonList!.next != null
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  onPressed: viewModel.pokemonList!.next != null
                      ? () => viewModel
                          .carregarPokemons(viewModel.pokemonList!.next!)
                      : null,
                ),
              ],
            ),
    );
  }
}
