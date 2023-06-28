import 'package:json_annotation/json_annotation.dart';

part 'type_model.g.dart';

@JsonSerializable()
class TypeModel {

  
  TypeModel(
    {
      required this.name,
      required this.url
    }
  );
  
  @JsonKey(name: 'official-artwork')
  String name;
  String url;


  factory TypeModel.fromJson(Map<String, dynamic> json) => _$TypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$TypeModelToJson(this);
}