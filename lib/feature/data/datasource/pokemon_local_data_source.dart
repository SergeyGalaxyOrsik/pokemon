import 'package:pokemon/feature/data/models/pokemon_model.dart';

abstract class PokemonLocalDataSource {
  /// Gets the cached [List<PokemonModel>] which was gotten the last time
  /// the user had an internet connection
  /// 
  /// Throws [CacheException] if no cached data is present.
  
  Future<List<PokemonModel>> getLastPokemonsFromCache();
  Future<void> pokemonsToCache(List<PokemonModel> pokemons);
}

class PokemonLocalDataSourceImpl implements PokemonLocalDataSource {
  @override
  Future<List<PokemonModel>> getLastPokemonsFromCache() {
    // TODO: implement getLastPokemonsFromCache
    throw UnimplementedError();
  }

  @override
  Future<void> pokemonsToCache(List<PokemonModel> pokemons) {
    // TODO: implement pokemonsToCache
    throw UnimplementedError();
  }

}