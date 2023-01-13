import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_dex/pokemon_list/models/pokemon_list_results.model.dart';
import 'package:poke_dex/pokemon_list/views/pokemon_list.viewmodel.dart';
import 'package:poke_dex/utils/extensions/string.extension.dart';

class PokemonList extends StatelessWidget {
  final PokemonListViewModel viewModel;

  const PokemonList({
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => viewModel.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Flexible(
              child: ListView.builder(
                itemCount: viewModel.pokemonList!.results!.length,
                itemBuilder: (BuildContext context, int index) {
                  PokemonListResultsModel pokemonResult =
                      viewModel.pokemonList!.results![index];

                  return Column(
                    children: [
                      ListTile(
                        title: Center(
                          child: Text(
                            'Pokemon: ${pokemonResult.name.capitalize()}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        subtitle: Center(
                          child: Text(
                            pokemonResult.url,
                            style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ),
                        onTap: () => Modular.to.pushNamed(
                          '/detalhes-pokemon',
                          arguments: {
                            'urlDetalhes': pokemonResult.url,
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
}
