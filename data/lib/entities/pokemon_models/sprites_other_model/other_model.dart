import 'package:data/entities/pokemon_models/official_artwork_model/official_artwork_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'other_model.g.dart';

@JsonSerializable()
class OtherModel {

  
  OtherModel(
    {
      required this.officialArtwork
    }
  );
  
  @JsonKey(name: 'official-artwork')
  OfficialArtworkModel officialArtwork;


  factory OtherModel.fromJson(Map<String, dynamic> json) => _$OtherModelFromJson(json);

  Map<String, dynamic> toJson() => _$OtherModelToJson(this);
}