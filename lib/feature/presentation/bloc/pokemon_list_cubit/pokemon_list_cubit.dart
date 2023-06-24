import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/feature/domain/entities/pokemon_entity.dart';
import 'package:pokemon/feature/domain/usecases/get_all_pokemons.dart';
import 'package:pokemon/feature/presentation/bloc/pokemon_list_cubit/pokemon_list_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

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
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexcepted Error';
    }
  }

}