// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'districts_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistrictsInfo _$DistrictsInfoFromJson(Map<String, dynamic> json) =>
    DistrictsInfo(
      districts: (json['districts'] as List<dynamic>?)
          ?.map((e) => District.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DistrictsInfoToJson(DistrictsInfo instance) =>
    <String, dynamic>{
      'districts': instance.districts,
    };
