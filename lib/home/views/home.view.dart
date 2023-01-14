import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../custom_pokemons/custom_pokemon_list/views/custom_pokemons_list.view.dart';
import '../../pokemons/pokemons_list/views/pokemons_list.view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Pokedex by Jean :)',
              ),
              bottom: const TabBar(
                tabs: [
                  _TabWidget(
                    nome: 'Pokémons',
                    icone: MdiIcons.pokeball,
                  ),
                  _TabWidget(
                    nome: 'Custom Pokémons',
                    icone: MdiIcons.pokemonGo,
                  ),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                PokemonsListView(),
                CustomPokemonListView(),
              ],
            ),
          ),
        ),
      );
}

class _TabWidget extends StatelessWidget {
  const _TabWidget({
    required this.nome,
    required this.icone,
    Key? key,
  }) : super(key: key);

  final String nome;
  final IconData icone;

  @override
  Widget build(BuildContext context) => Tab(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              nome,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              icone,
            ),
          ],
        ),
      );
}
