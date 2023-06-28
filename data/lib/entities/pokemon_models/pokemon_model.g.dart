// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonModel _$PokemonModelFromJson(Map<String, dynamic> json) => PokemonModel(
      id: json['id'] as int,
      name: json['name'] as String,
      sprites: SpritesModel.fromJson(json['sprites'] as Map<String, dynamic>),
      weight: json['weight'] as int,
      height: json['height'] as int,
      types: json['types'] as List<dynamic>,
    );

Map<String, dynamic> _$PokemonModelToJson(PokemonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sprites': instance.sprites,
      'weight': instance.weight,
      'height': instance.height,
      'types': instance.types,
    };
