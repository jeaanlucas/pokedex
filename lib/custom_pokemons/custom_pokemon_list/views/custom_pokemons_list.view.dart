import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
        // body: Column(
        //   children: [
        //     const SizedBox(
        //       height: 15,
        //     ),
        //     PokemonNavigatorWidget(
        //       viewModel: _viewModel,
        //     ),
        //     const SizedBox(
        //       height: 25,
        //     ),
        //     PokemonListWidget(
        //       viewModel: _viewModel,
        //     ),
        //   ],
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Modular.to.pushNamed(
            '/custom-pokemons/new',
          ),
          tooltip: 'Criar um novo Pokémon',
          child: const Icon(
            MdiIcons.pokeball,
          ),
        ),
      );
}
