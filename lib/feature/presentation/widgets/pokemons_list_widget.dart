import 'package:core_ui/core_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/feature/domain/entities/pokemon_entity.dart';
import 'package:pokemon/feature/presentation/bloc/pokemon_list_cubit/pokemon_list_cubit.dart';
import 'package:pokemon/feature/presentation/bloc/pokemon_list_cubit/pokemon_list_state.dart';
import 'package:pokemon/feature/presentation/widgets/pokemon_card_widget.dart';

class PokemonList extends StatelessWidget {
  final scrollController = ScrollController();

  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if(scrollController.position.atEdge) {
        if(scrollController.position.pixels != 0) {
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
          return _loadingIndicator();
        }else if(state is PokemonLoading) {
          pokemons = state.oldPokemonList;
          isLoading = true;
        } 
        else if (state is PokemonLoaded) {
          pokemons = state.pokemonsList;
        } else if (state is PokemonError) {
          return Text(state.message, style: AppFonts.subtitleBold14,);
        }
        return ListView.builder(
          controller: scrollController,
          itemBuilder: (context, index) {
            if (index < pokemons.length) {
              return PokemonCard(pokemon: pokemons[index]);
            } else {
              return Center(child: _loadingIndicator());
            }
          },
          itemCount: pokemons.length + (isLoading ? 1 : 0),
        );
      },
    );
  }

  Widget _loadingIndicator() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: CircularProgressIndicator(),
    );
  }
}
