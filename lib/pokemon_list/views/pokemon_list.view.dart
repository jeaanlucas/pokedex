import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_dex/pokemon_list/views/pokemon_list.viewmodel.dart';
import 'package:poke_dex/pokemon_list/widgets/pokemon_navigator.widget.dart';

import '../widgets/pokemon_list.widget.dart';

class PokemonListView extends StatefulWidget {
  const PokemonListView({Key? key}) : super(key: key);

  @override
  State<PokemonListView> createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<PokemonListView> {
  final PokemonListViewModel _viewModel = Modular.get();

  @override
  void initState() {
    _carregarPokemons('https://pokeapi.co/api/v2/pokemon/');
    super.initState();
  }

  void _carregarPokemons(String url) => _viewModel.carregarPokemons(url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pokedex do Jean :)',
        ),
      ),
      body: Column(
        children: [
          PokemonNavigator(
            viewModel: _viewModel,
          ),
          const SizedBox(
            height: 25,
          ),
          PokemonList(
            viewModel: _viewModel,
          ),
        ],
      ),
    );
  }
}
