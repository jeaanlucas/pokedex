import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../utils/extensions/string.extension.dart';
import '../models/pokemons_list_results.model.dart';
import '../views/pokemons_list.viewmodel.dart';

class PokemonsListWidget extends StatelessWidget {
  const PokemonsListWidget({
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  final PokemonsListViewModel viewModel;

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => viewModel.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Flexible(
                child: ListView.separated(
                  itemCount: viewModel.pokemonList!.results!.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    PokemonsListResultsModel pokemonResult =
                        viewModel.pokemonList!.results![index];

                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Pokemon: ${pokemonResult.name.capitalize()}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          subtitle: Text(
                            pokemonResult.url,
                            style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                          onTap: () => Modular.to.pushNamed(
                            '/pokemons/detalhes',
                            arguments: {
                              'urlDetalhes': pokemonResult.url,
                              'nomePokemon': pokemonResult.name,
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
      );
}
