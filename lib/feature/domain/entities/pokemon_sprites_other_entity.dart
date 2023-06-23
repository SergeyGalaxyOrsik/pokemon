import 'package:pokemon/feature/domain/entities/pokemon_dreamworld_entity.dart';
import 'package:pokemon/feature/domain/entities/pokemon_sprites_home_entity.dart';
import 'package:pokemon/feature/domain/entities/pokemon_sprites_officialartwork_entity.dart';

class OtherEntity {
  DreamWorldEntity? dreamWorld;
  HomeEntity? home;
  OfficialArtworkEntity? officialArtwork;

  OtherEntity({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
  });
}