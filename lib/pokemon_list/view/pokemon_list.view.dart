import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_dex/pokemon_list/view/pokemon_list.viewmodel.dart';

class PokemonListView extends StatefulWidget {
  PokemonListView({Key? key}) : super(key: key);

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

  void _carregarPokemons(String url) {
    _viewModel.carregarPokemons(url);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

    );
  }
}
