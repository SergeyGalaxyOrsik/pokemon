import 'package:pokemon/core/error/exceptions.dart';
import 'package:pokemon/feature/data/models/pokemon_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

abstract class PokemonLocalDataSource {
  /// Gets the cached [List<PokemonModel>] which was gotten the last time
  /// the user had an internet connection
  ///
  /// Throws [CacheException] if no cached data is present.

  Future<List<PokemonModel>> getLastPokemonsFromCache();
  Future<void> pokemonsToCache(List<PokemonModel> pokemons);
}

const CACHED_POKEMONS_LIST = 'CACHED_POKEMONS_LIST';

class PokemonLocalDataSourceImpl implements PokemonLocalDataSource {
  final SharedPreferences sharedPreferences;

  PokemonLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<PokemonModel>> getLastPokemonsFromCache() {
    final jsonPersonList =
        sharedPreferences.getStringList(CACHED_POKEMONS_LIST);
    if (jsonPersonList!.isNotEmpty) {
      return Future.value(jsonPersonList
          .map((pokemon) => PokemonModel.fromJson(json.decode(pokemon)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> pokemonsToCache(List<PokemonModel> pokemons) {
    final List<String> jsonPersonList =
        pokemons.map((pokemon) => json.encode(pokemon.toJson())).toList();

    sharedPreferences.setStringList(CACHED_POKEMONS_LIST, jsonPersonList);
    return Future.value(jsonPersonList);
  }
}
