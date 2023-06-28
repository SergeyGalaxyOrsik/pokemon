
import 'package:data/data.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PokemonRemoteProvider {
  /// Calls the https://pokeapi.co/api/v2/pokemon?offset=0&limit=20 endpoint
  ///
  /// Throws a [ServerException] for all error codes.
  // Future<List<PokemonModel>> getAllPokemons(int offset);
  final http.Client client;

  PokemonRemoteProvider({required this.client});

  Future<List<PokemonModel>> getAllPokemons(int offset) => _getPokemonsFromUrl(
      'https://pokeapi.co/api/v2/pokemon?offset=$offset&limit=20');

  Future<List<PokemonModel>> _getPokemonsFromUrl(String url) async {
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
