import 'dart:async';

import 'package:core_ui/core_ui.dart';
import 'package:core_ui/src/widgets/loading_indicator.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pokemon_card_widget.dart';

class PokemonList extends StatelessWidget {
  final scrollController = ScrollController();

  final List<PokemonEntity> pokemons;
  final Future<void> updateBloc;
  bool isLoading;

  PokemonList(
      {super.key,
      required this.pokemons,
      required this.updateBloc,
      required this.isLoading});

  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<PokemonListCubit>(context).loadPokemon();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemBuilder: (context, index) {
        if (index < pokemons.length) {
          return PokemonCard(pokemon: pokemons[index]);
        } else {
          Timer(
            const Duration(microseconds: 30),
            () {
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent);
            },
          );
          return Center(child: loadingIndicator());
        }
      },
      itemCount: pokemons.length + (isLoading ? 1 : 0),
    );
  }
}
