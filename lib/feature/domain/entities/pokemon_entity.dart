import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  final int id;
  final String name;
  final String sprites;
  final int weight;
  final int height;
  final String types;

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
