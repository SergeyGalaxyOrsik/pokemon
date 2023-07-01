import 'package:data/entities/pokemon_models/sprites_other_model/other_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sprites_model.g.dart';

@JsonSerializable()
class SpritesModel {

  
  SpritesModel({required this.other});

  OtherModel other;

  factory SpritesModel.fromJson(Map<String, dynamic> json) => _$SpritesModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesModelToJson(this);
}