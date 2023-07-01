import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/usecases/get_all_pokemons.dart';
import 'package:core_ui/src/widgets/pokemon_list_cubit/pokemon_list_state.dart';


class PokemonListCubit extends Cubit<PokemonState> {
  final GetAllPokemons getAllPokemons;

  PokemonListCubit({required this.getAllPokemons}) : super(PokemonEmpty());

  int offset = 0;

  void loadPokemon() async{
    if (state is PokemonLoading) return;

    final currentState = state;
    
    var oldPokemons = <PokemonEntity>[];

    if(currentState is PokemonLoaded) {
      oldPokemons = currentState.pokemonsList;  
    }

    emit(PokemonLoading(oldPokemons, isFirstFetch: offset == 1));

    final failureOrPokemon = await getAllPokemons(PagePokemonParams(offset: offset));

    failureOrPokemon.fold((error) => emit(PokemonError(message: _mapFailureToMessage(error))), (character) {
      offset = offset + 20;
      final pokemons = (state as PokemonLoading).oldPokemonList;
      pokemons.addAll(character);
      emit(PokemonLoaded(pokemons));
    });
  }

  String _mapFailureToMessage(Failure failure ) {
    switch(failure.runtimeType) {
      case ServerFailure:
        return FailureConstants.serverFailureMessage;
      case CacheFailure:
        return FailureConstants.cachedFailureMessage;
      default:
        return 'Unexcepted Error';
    }
  }

}