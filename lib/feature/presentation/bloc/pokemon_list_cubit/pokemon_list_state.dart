import 'package:equatable/equatable.dart';
import 'package:pokemon/feature/domain/entities/pokemon_entity.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object?> get props => [];

}

class PokemonEmpty extends PokemonState{
  @override
  List<Object?> get props => [];
}

class PokemonLoading extends PokemonState {
  final List<PokemonEntity> oldPokemonList;
  final bool isFirstFetch;

  PokemonLoading(this.oldPokemonList, {this.isFirstFetch = false});

  
  @override
  List<Object?> get props => [oldPokemonList];
}

class PokemonLoaded extends PokemonState {
  final List<PokemonEntity> pokemonsList;

  PokemonLoaded(this.pokemonsList);

  @override
  List<Object?> get props => [pokemonsList];
}

class PokemonError extends PokemonState {
  final String message;

  PokemonError({required this.message});

  @override
  List<Object?> get props => [message];
}