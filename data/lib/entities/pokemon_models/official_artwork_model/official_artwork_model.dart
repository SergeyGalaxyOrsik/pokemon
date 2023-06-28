import 'package:json_annotation/json_annotation.dart';

part 'official_artwork_model.g.dart';

@JsonSerializable()
class OfficialArtworkModel {
  
  OfficialArtworkModel(
    {
      required this.frontDefault
    }
  );

  @JsonKey(name: 'front_default')
  String frontDefault;

  factory OfficialArtworkModel.fromJson(Map<String, dynamic> json) => _$OfficialArtworkModelFromJson(json);

  Map<String, dynamic> toJson() => _$OfficialArtworkModelToJson(this);
}