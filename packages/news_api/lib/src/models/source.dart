
import 'package:json_annotation/json_annotation.dart';
part 'source.g.dart';

@JsonSerializable()
class Source{

  final String? id;
  final String? name;

  const Source({this.id = "No id", this.name ="Unknown"});

  factory Source.fromJson(Map<String, dynamic> json) =>
      _$SourceFromJson(json);

}