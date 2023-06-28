import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

abstract class PokemonLocalProvider {
  /// Gets the cached [List<PokemonModel>] which was gotten the last time
  /// the user had an internet connection
  ///
  /// Throws [CacheException] if no cached data is present.

  Future<List<PokemonModel>> getLastPokemonsFromCache();
  Future<void> pokemonsToCache(List<PokemonModel> pokemons);
}



class PokemonLocalProviderImpl implements PokemonLocalProvider {
  final SharedPreferences sharedPreferences;

  PokemonLocalProviderImpl({required this.sharedPreferences});

  @override
  Future<List<PokemonModel>> getLastPokemonsFromCache() {
    final jsonPersonList =
        sharedPreferences.getStringList(StringConstants.cachedPokemonList);
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

    sharedPreferences.setStringList(StringConstants.cachedPokemonList, jsonPersonList);
    // ignore: void_checks
    return Future.value(jsonPersonList);
  }
}