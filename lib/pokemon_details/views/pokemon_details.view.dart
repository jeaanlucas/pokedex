import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pokemon_details.viewmodel.dart';

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
  final PokemonDetailsViewModel _viewModel = Modular.get();

  @override
  void initState() {
    _obterDetalhesPokemon();
    super.initState();
  }

  void _obterDetalhesPokemon() =>
      _viewModel.obterDetalhesPokemon(widget.urlDetalhes);

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
