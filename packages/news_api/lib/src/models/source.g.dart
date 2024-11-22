// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Source _$SourceFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Source',
      json,
      ($checkedConvert) {
        final val = Source(
          id: $checkedConvert('id', (v) => v as String? ?? "No id"),
          name: $checkedConvert('name', (v) => v as String? ?? "Unknown"),
        );
        return val;
      },
    );
