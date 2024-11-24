import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';

@JsonSerializable()
class Source extends Equatable{

  final String id;
  final String name;

  const Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) =>
      _$SourceFromJson(json);

  @override
  List<Object?> get props => [id,name];

}