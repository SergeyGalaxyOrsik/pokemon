import 'package:dartz/dartz.dart';
import 'package:domain/repositories/pokemon_repositories.dart';
import 'package:domain/usecases/usecase.dart';
import 'package:data/data.dart';
// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';

class GetAllPokemons
    extends FailureUseCase<List<PokemonEntity>, PagePokemonParams> {
  final PokemonRepository pokemonRepository;

  GetAllPokemons(this.pokemonRepository);

  @override
  Future<Either<Failure, List<PokemonEntity>>> call(
      PagePokemonParams params) async {
    return await pokemonRepository.getAllPokemons(params.offset);
  }
}

class PagePokemonParams extends Equatable {
  final int offset;

  const PagePokemonParams({required this.offset});

  @override
  List<Object?> get props => [offset];
}
