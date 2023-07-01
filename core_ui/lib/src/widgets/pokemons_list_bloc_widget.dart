import 'package:core_ui/core_ui.dart';
import 'package:core_ui/src/widgets/loading_indicator.dart';
import 'package:core_ui/src/widgets/pokemon_list_cubit/pokemon_list_state.dart';
import 'package:core_ui/src/widgets/pokemon_list_widget.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonListBloc extends StatelessWidget {

  const PokemonListBloc({super.key});

  Future<void> updateBloc(BuildContext context) async {
    BlocProvider.of<PokemonListCubit>(context).loadPokemon();
  }

  @override
  Widget build(BuildContext context) {
    updateBloc(context);

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
        return PokemonList(
          pokemons: pokemons,
          isLoading: isLoading,
          updateBloc: updateBloc(context),
        );
      },
    );
  }
}
