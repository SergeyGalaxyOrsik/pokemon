import 'package:pokemon/feature/domain/entities/pokemon_dreamworld_entity.dart';
import 'package:pokemon/feature/domain/entities/pokemon_sprites_entity.dart';
import 'package:pokemon/feature/domain/entities/pokemon_sprites_home_entity.dart';
import 'package:pokemon/feature/domain/entities/pokemon_sprites_officialartwork_entity.dart';
import 'package:pokemon/feature/domain/entities/pokemon_sprites_other_entity.dart';

class SpritesModel extends SpritesEntity {
  SpritesModel({
    required super.backDefault,
    required super.backFemale,
    required super.backShiny,
    required super.backShinyFemale,
    required super.frontDefault,
    required super.frontFemale,
    required super.frontShiny,
    required super.frontShinyFemale,
    required super.other,
  });

  factory SpritesModel.fromJson(Map<String, dynamic> json) {
    return SpritesModel(
      backDefault: json['back_default'],
      backFemale: json['back_female'],
      backShiny: json['back_shiny'],
      backShinyFemale: json['back_shiny_female'],
      frontDefault: json['front_default'],
      frontFemale: json['front_female'],
      frontShiny: json['front_shiny'],
      frontShinyFemale: json['front_shiny_female'],
      other: json['other'] != null ? new OtherModel.fromJson(json['other']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'backDefault': backDefault,
      'backFemale': backFemale,
      'backShiny': backShiny,
      'backShinyFemale': backShinyFemale,
      'frontDefault': frontDefault,
      'frontFemale': frontFemale,
      'frontShiny': frontShiny,
      'frontShinyFemale': frontShinyFemale,
      'other': other
    };
  }
}

class OtherModel extends OtherEntity {
  OtherModel({
    required super.dreamWorld,
    required super.home,
    required super.officialArtwork,
  });

  factory OtherModel.fromJson(Map<String, dynamic> json) {
    return OtherModel(
      dreamWorld: json['dream_world'] != null
          ? new DreamWorldModel.fromJson(json['dream_world'])
          : null,
      home: json['home'] != null ? new HomeModel.fromJson(json['home']) : null,
      officialArtwork: json['official-artwork'] != null
          ? new OfficialArtworkModel.fromJson(json['official-artwork'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dreamWorld': dreamWorld,
      'home': home,
      'officialArtwork': officialArtwork,
    };
  }
}

class DreamWorldModel extends DreamWorldEntity {
  DreamWorldModel({
    required super.frontDefault,
    required super.frontFemale,
  });

  factory DreamWorldModel.fromJson(Map<String, dynamic> json) {
    return DreamWorldModel(
      frontDefault: json['front_default'],
      frontFemale: json['front_female'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'frontDefault': frontDefault,
      'frontFeamle': frontDefault,
    };
  }
}

class HomeModel extends HomeEntity {
  HomeModel(
      {required super.frontDefault,
      required super.frontFemale,
      required super.frontShiny,
      required super.frontShinyFemale});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      frontDefault: json['front_default'],
      frontFemale: json['front_female'],
      frontShiny: json['front_shiny'],
      frontShinyFemale: json['front_shiny_female'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'frontDefault': frontDefault,
      'frontFemale': frontFemale,
      'frontShiny': frontShiny,
      'frontShinyFemale': frontShinyFemale,
    };
  }
}

class OfficialArtworkModel extends OfficialArtworkEntity {
  OfficialArtworkModel({
    required super.frontDefault,
    required super.frontShiny,
  });

  factory OfficialArtworkModel.fromJson(Map<String, dynamic> json) {
    return OfficialArtworkModel(
      frontDefault: json['front_default'],
      frontShiny: json['front_shiny'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'frontDefault': frontDefault, 'frontShiny': frontShiny};
  }
}
