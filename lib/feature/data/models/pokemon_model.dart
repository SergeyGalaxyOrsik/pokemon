import 'package:pokemon/feature/data/models/sprites_model.dart';
import 'package:pokemon/feature/domain/entities/pokemon_entity.dart';
import 'package:pokemon/feature/domain/entities/pokemon_type_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel({
    required super.id,
    required super.name,
    required super.sprites,
    required super.weight,
    required super.height,
    required super.types,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'] as int,
      name: json['id'] as String,
      sprites: json['sprites'] = SpritesModel.fromJson((json['other'] =
          OtherModel.fromJson((json['official-artwork'] =
                  OfficialArtworkModel.fromJson(json['front_default']))
              as Map<String, dynamic>)) as Map<String, dynamic>),
      weight: json['weight'] as int,
      height: json['height'] as int,
      types: json['types'][0]['type']['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'sprites': sprites,
      'weight': weight,
      'height': height,
      'types': types
    };
  }
}
