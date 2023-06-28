import 'package:dartz/dartz.dart';
import 'package:data/data.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<PokemonEntity>>> getAllPokemons(int offset);
}