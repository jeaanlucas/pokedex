import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';

import '../widgets/pokemons_list.widget.dart';
import '../widgets/pokemons_navigator.widget.dart';
import 'pokemons_list.viewmodel.dart';

class PokemonsListView extends StatefulWidget {
  const PokemonsListView({Key? key}) : super(key: key);

  @override
  State<PokemonsListView> createState() => _PokemonsListViewState();
}

class _PokemonsListViewState extends State<PokemonsListView> {
  final PokemonsListViewModel _viewModel = Modular.get();

  @override
  void initState() {
    _carregarPokemons(pokemonUrl);
    super.initState();
  }

  void _carregarPokemons(String url) => _viewModel.carregarPokemons(url);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            PokemonsNavigatorWidget(
              viewModel: _viewModel,
            ),
            const SizedBox(
              height: 25,
            ),
            PokemonsListWidget(
              viewModel: _viewModel,
            ),
          ],
        ),
      );
}
