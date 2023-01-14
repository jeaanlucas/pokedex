import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../views/pokemons_list.viewmodel.dart';

class PokemonsNavigatorWidget extends StatelessWidget {
  const PokemonsNavigatorWidget({
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  final PokemonsListViewModel viewModel;

  @override
  Widget build(BuildContext context) => Observer(
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
                    'NAVIGATION',
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
