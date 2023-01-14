import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../custom_pokemons/views/custom_pokemons_list.view.dart';
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
              bottom: TabBar(
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Pokémons',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          MdiIcons.pokeball,
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Custom Pokémons',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          MdiIcons.pokemonGo,
                        ),
                      ],
                    ),
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
