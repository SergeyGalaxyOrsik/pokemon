import 'package:pokemon/core/error/exceptions.dart';
import 'package:pokemon/feature/data/models/pokemon_model.dart';
import 'package:pokemon/feature/domain/entities/pokemon_entity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class PokemonRemoteDataSource {
  /// Calls the https://pokeapi.co/api/v2/pokemon?offset=0&limit=20 endpoint
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<PokemonEntity>> getAllPokemons(int offset);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final http.Client client;

  PokemonRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PokemonEntity>> getAllPokemons(int offset) => _getPokemonsFromUrl(
      'https://pokeapi.co/api/v2/pokemon?offset=$offset&limit=20');

  Future<List<PokemonModel>> _getPokemonsFromUrl(String url) async {
    print(url);
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final pokemons = json.decode(response.body);
      return (pokemons['results'] as List)
          .map((pokemon) => PokemonModel.fromJson(pokemon))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
