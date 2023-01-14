import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../utils/extensions/string.extension.dart';
import '../models/type.model.dart';
import '../views/pokemons_details.viewmodel.dart';

class PokemonsTypesWidget extends StatelessWidget {
  const PokemonsTypesWidget({
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  final PokemonsDetailsViewModel viewModel;

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => viewModel.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Flexible(
                child: ListView.builder(
                  itemCount: viewModel.pokemonDetails!.types!.length,
                  itemBuilder: (BuildContext context, int index) {
                    TypeModel type =
                        viewModel.pokemonDetails!.types![index].type;

                    return Column(
                      children: [
                        ListTile(
                          title: Center(
                            child: Text(
                              type.name.capitalize(),
                              style: TextStyle(
                                fontSize: 18.0,
                                color: viewModel.corDeAcordoComOTipo(type.name),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
      );
}
