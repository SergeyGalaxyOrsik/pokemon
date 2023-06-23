import 'package:dartz/dartz.dart';
import 'package:pokemon/core/error/exceptions.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/core/platform/network_info.dart';
import 'package:pokemon/feature/data/datasource/pokemon_local_data_source.dart';
import 'package:pokemon/feature/data/datasource/pokemon_remote_data_source.dart';
import 'package:pokemon/feature/domain/entities/pokemon_entity.dart';
import 'package:pokemon/feature/domain/repositories/pokemon_repositories.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;
  final PokemonLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PokemonRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<PokemonEntity>>> getAllPokemons(
      int offset) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePokemon = await remoteDataSource.getAllPokemons(offset);
        localDataSource.pokemonsToCache(remotePokemon);
        return Right(remotePokemon);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPokemon = await localDataSource.getLastPokemonsFromCache();
        return Right(localPokemon);
      } on CacheException{
        return Left(CacheFailure());
      }
    }
  }
}
