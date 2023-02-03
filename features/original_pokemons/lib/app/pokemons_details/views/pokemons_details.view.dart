import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:commons_dependencies/commons_dependencies.dart';
import '../widgets/pokemons_abilities.widget.dart';
import '../widgets/pokemons_pictures.widget.dart';
import '../widgets/pokemons_types.widget.dart';
import 'pokemons_details.viewmodel.dart';

class PokemonsDetailsView extends StatefulWidget {
  const PokemonsDetailsView({
    required this.urlDetalhes,
    required this.nomePokemon,
    Key? key,
  }) : super(key: key);

  final String urlDetalhes;
  final String nomePokemon;

  @override
  State<PokemonsDetailsView> createState() => _PokemonsDetailsViewState();
}

class _PokemonsDetailsViewState extends State<PokemonsDetailsView> {
  final PokemonsDetailsViewModel _viewModel = Modular.get();

  @override
  void initState() {
    _obterDetalhesPokemon();
    super.initState();
  }

  void _obterDetalhesPokemon() =>
      _viewModel.obterDetalhesPokemon(widget.urlDetalhes);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Pokemon details',
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.nomePokemon.capitalize(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            PokemonsPicturesWidget(
              viewModel: _viewModel,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Types',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.redAccent,
              ),
            ),
            PokemonsTypesWidget(
              viewModel: _viewModel,
            ),
            const Text(
              'Abilities',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.redAccent,
              ),
            ),
            PokemonsAbilitiesWidget(
              viewModel: _viewModel,
            ),
          ],
        ),
      );
}
