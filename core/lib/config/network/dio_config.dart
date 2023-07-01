import 'dart:async';
import 'dart:convert';

import 'package:data/data.dart';
import 'package:dio/dio.dart';

part 'interceptors/error_interceptor.dart';
part 'interceptors/request_interceptor.dart';
part 'interceptors/response_interceptor.dart';

class DioConfig {


  final Dio _dio = Dio();

  Dio get dio => _dio;

  DioConfig();


  Future<List<PokemonModel>> getAllPokemonsFromNetwork(int offsetApi) async {
    final response = await _dio.get('https://pokeapi.co/api/v2/pokemon?offset=$offsetApi&limit=20');

    if (response.statusCode == 200) {
      dynamic pokemons = json.decode(response.data.body);
      dynamic pokemon;
      List pokemonList = [];
      for (pokemon in pokemons['result']) {
        dynamic responceOnePokemon = await _dio.get(pokemon['url']);
        pokemonList.add(json.decode(responceOnePokemon.body));
      }

      return pokemonList
          .map((pokemon) => PokemonModel.fromJson(pokemon))
          .toList();
    } else {
      throw ServerException();
    }
  }

}
