import 'package:data/entities/pokemon_models/sprites_models/sprites_model.dart';
import 'package:data/entities/pokemon_models/type_model/type_model.dart';
import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  final int id;
  final String name;
  final SpritesModel sprites;
  final int weight;
  final int height;
  final List<dynamic> types;

  const PokemonEntity({
    required this.id,
    required this.name,
    required this.sprites,
    required this.weight,
    required this.height,
    required this.types,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        sprites,
        weight,
        height,
        types,
      ];
}
