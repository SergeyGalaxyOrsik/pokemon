import 'package:equatable/equatable.dart';
import 'package:pokemon/feature/domain/entities/pokemon_sprites_entity.dart';
import 'package:pokemon/feature/domain/entities/pokemon_type_entity.dart';

class PokemonEntity extends Equatable {
  final int id;
  final String name;
  final SpritesEntity sprites;
  final int weight;
  final int height;
  final List<TypesEntity> types;

  PokemonEntity(
      {required this.id,
      required this.name,
      required this.sprites,
      required this.weight,
      required this.height,
      required this.types});

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
