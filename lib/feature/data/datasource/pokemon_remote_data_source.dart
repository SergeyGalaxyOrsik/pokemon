import 'package:pokemon/core/error/exceptions.dart';
import 'package:pokemon/feature/data/models/pokemon_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class PokemonRemoteDataSource {
  /// Calls the https://pokeapi.co/api/v2/pokemon?offset=0&limit=20 endpoint
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<PokemonModel>> getAllPokemons(int offset);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final http.Client client;

  PokemonRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PokemonModel>> getAllPokemons(int offset) => _getPokemonsFromUrl(
      'https://pokeapi.co/api/v2/pokemon?offset=$offset&limit=20');

  Future<List<PokemonModel>> _getPokemonsFromUrl(String url) async {
    print(url);
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      var listPokemons = json.decode(response.body);
      var pokemons = [];
      for(int i = 0; i < listPokemons['results'].length; i++) {
        // print(listPokemons['results'][i]['url']);
        var responseOnePokemon = await client
        .get(Uri.parse(listPokemons['results'][i]['url']), headers: {'Content-Type': 'application/json'});
        var pokemon = json.decode(responseOnePokemon.body);
        print(pokemon['id']);
        pokemons.add(pokemon);
      }
      
      // print(pokemons);
      return pokemons
          .map((pokemon) => PokemonModel.fromJson(pokemon))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
