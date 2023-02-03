import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_pokemons_list.widget.dart';
import 'custom_pokemons_list.viewmodel.dart';

class CustomPokemonListView extends StatefulWidget {
  const CustomPokemonListView({Key? key}) : super(key: key);

  @override
  State<CustomPokemonListView> createState() => _CustomPokemonListViewState();
}

class _CustomPokemonListViewState extends State<CustomPokemonListView> {
  final CustomPokemonsListViewModel _viewModel = Modular.get();

  @override
  void initState() {
    _carregarPokemons();
    super.initState();
  }

  void _carregarPokemons() => _viewModel.carregarPokemons();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            CustomPokemonsListWidget(
              viewModel: _viewModel,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Modular.to.pushNamed(
            '/custom-pokemons/new',
            arguments: {
              'pokemonModel': null,
            },
          ),
          tooltip: 'Create new custom Pokémon',
          child: const Icon(
            MdiIcons.pokeball,
          ),
        ),
      );
}
