import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:custom_pokemons/custom_pokemons.dart';
import 'package:flutter/material.dart';
import 'package:original_pokemons/original_pokemons.dart';

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
                isScrollable: true,
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
