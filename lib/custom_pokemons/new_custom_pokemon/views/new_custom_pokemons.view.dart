import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NewCustomPokemonView extends StatefulWidget {
  const NewCustomPokemonView({Key? key}) : super(key: key);

  @override
  State<NewCustomPokemonView> createState() => _NewCustomPokemonViewState();
}

class _NewCustomPokemonViewState extends State<NewCustomPokemonView> {
  // final PokemonListViewModel _viewModel = Modular.get();

  // @override
  // void initState() {
  //   _carregarPokemons('https://pokeapi.co/api/v2/pokemon/');
  //   super.initState();
  // }
  //
  // void _carregarPokemons(String url) => _viewModel.carregarPokemons(url);

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
          onPressed: () => Modular.to.pop(),
          tooltip: 'Save Pokémon',
          child: const Icon(
            Icons.save,
          ),
        ),
      );
}
