import 'package:dartz/dartz.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/feature/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<Either<Failure,List<PokemonEntity>>> getAllPokemons(int offset);
}