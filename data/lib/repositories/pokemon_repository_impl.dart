import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:domain/repositories/pokemon_repositories.dart';
import 'package:core/platform/network_info.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteProvider remoteDataSource;
  final PokemonLocalProvider localDataSource;
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
