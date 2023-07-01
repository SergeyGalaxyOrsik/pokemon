import 'dart:async';

import 'package:core_ui/src/widgets/loading_indicator.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';

import 'pokemon_card_widget.dart';

// ignore: must_be_immutable
class PokemonList extends StatelessWidget {
  final _scrollController = ScrollController();

  final List<PokemonEntity> pokemons;
  final Future<void> updateBloc;
  bool isLoading;

  PokemonList(
      {super.key,
      required this.pokemons,
      required this.updateBloc,
      required this.isLoading});

  void setupScrollController(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          updateBloc;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemBuilder: (context, index) {
        if (index < pokemons.length) {
          return PokemonCard(pokemon: pokemons[index]);
        } else {
          return Center(child: loadingIndicator());
        }
      },
      itemCount: pokemons.length + (isLoading ? 1 : 0),
    );
  }
}
