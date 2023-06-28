import 'dart:async';

import 'package:core_ui/src/widgets/loading_indicator.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'pokemon_card_widget.dart';

// ignore: must_be_immutable
class PokemonList extends StatelessWidget {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final List<PokemonEntity> pokemons;
  final Future<void> updateBloc;
  bool isLoading;

  PokemonList(
      {super.key,
      required this.pokemons,
      required this.updateBloc,
      required this.isLoading});


  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
    updateBloc;
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      child: ListView.builder(
        // controller: _scrollController,
        itemBuilder: (context, index) {
          if (index < pokemons.length) {
            return PokemonCard(pokemon: pokemons[index]);
          } else {
            return Center(child: loadingIndicator());
          }
        },
        itemCount: pokemons.length + (isLoading ? 1 : 0),
      ),
    );
  }
}
