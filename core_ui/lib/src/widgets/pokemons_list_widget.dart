import 'package:core_ui/core_ui.dart';
import 'package:core_ui/src/widgets/loading_indicator.dart';
import 'package:core_ui/src/widgets/pokemon_card_widget.dart';
import 'package:core_ui/src/widgets/pokemon_full_card_widget.dart';
import 'package:core_ui/src/widgets/pokemon_list_cubit/pokemon_list_state.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonList extends StatelessWidget {
  final scrollController = ScrollController();

  PokemonList({super.key});

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
    setupScrollController(context);

    return BlocBuilder<PokemonListCubit, PokemonState>(
      builder: (context, state) {
        List<PokemonEntity> pokemons = [];
        bool isLoading = false;
        if (state is PokemonLoading && state.isFirstFetch) {
          return loadingIndicator();
        } else if (state is PokemonLoading) {
          pokemons = state.oldPokemonList;
          isLoading = true;
        } else if (state is PokemonLoaded) {
          pokemons = state.pokemonsList;
        } else if (state is PokemonError) {
          return Text(
            state.message,
            style: AppFonts.subtitleBold14,
          );
        }
        return ListView.builder(
          controller: scrollController,
          itemBuilder: (context, index) {
            if (index < pokemons.length) {
              return PokemonCard(pokemon: pokemons[index]);
            } else {
              return Center(child: loadingIndicator());
            }
          },
          itemCount: pokemons.length + (isLoading ? 1 : 0),
        );
      },
    );
  }
}
