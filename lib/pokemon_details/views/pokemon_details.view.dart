import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../utils/extensions/string.extension.dart';
import '../models/abilities.model.dart';
import '../widgets/pokemon_abilities.widget.dart';
import '../widgets/pokemon_pictures.widget.dart';
import '../widgets/pokemon_types.widget.dart';
import 'pokemon_details.viewmodel.dart';

class PokemonDetailsView extends StatefulWidget {
  const PokemonDetailsView({
    required this.urlDetalhes,
    required this.nomePokemon,
    Key? key,
  }) : super(key: key);

  final String urlDetalhes;
  final String nomePokemon;

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
            PokemonPicturesWidget(
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
            PokemonTypesWidget(
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
            PokemonAbilitiesWidget(
              viewModel: _viewModel,
            ),
          ],
        ),
      );
}
