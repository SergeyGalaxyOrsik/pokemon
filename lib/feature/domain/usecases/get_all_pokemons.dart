import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/core/usecases/usecase.dart';
import 'package:pokemon/feature/domain/entities/pokemon_entity.dart';
import 'package:pokemon/feature/domain/repositories/pokemon_repositories.dart';

class GetAllPokemons extends UseCase<List<PokemonEntity>, PagePokemonParams>{
  final PokemonRepository pokemonRepository;

  GetAllPokemons(this.pokemonRepository);

  Future<Either<Failure, List<PokemonEntity>>> call(PagePokemonParams params) async {
    return await pokemonRepository.getAllPokemons(params.offset);
  }

}

class PagePokemonParams extends Equatable {
  final int offset;

  PagePokemonParams({required this.offset});

  @override
  List<Object?> get props => [offset];
}