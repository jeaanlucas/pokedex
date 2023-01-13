import 'package:flutter/material.dart';

class PokemonDetailsView extends StatefulWidget {
  final String urlDetalhes;

  const PokemonDetailsView({
    required this.urlDetalhes,
    Key? key,
  }) : super(key: key);

  @override
  State<PokemonDetailsView> createState() => _PokemonDetailsViewState();
}

class _PokemonDetailsViewState extends State<PokemonDetailsView> {
  // final PokemonListViewModel _viewModel = Modular.get();

  // @override
  // void initState() {
  //   _carregarPokemons('https://pokeapi.co/api/v2/pokemon/');
  //   super.initState();
  // }
  //
  // void _carregarPokemons(String url) => _viewModel.carregarPokemons(url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalhes do pokemon',
        ),
      ),
      // body: Column(
      //   children: [
      //     PokemonNavigator(
      //       viewModel: _viewModel,
      //     ),
      //     const SizedBox(
      //       height: 25,
      //     ),
      //     PokemonList(
      //       viewModel: _viewModel,
      //     ),
      //   ],
      // ),
    );
  }
}
