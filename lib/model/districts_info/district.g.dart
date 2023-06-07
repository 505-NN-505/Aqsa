// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

District _$DistrictFromJson(Map<String, dynamic> json) => District(
      id: json['id'] as String?,
      divisionId: json['division_id'] as String?,
      name: json['name'] as String?,
      bnName: json['bn_name'] as String?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
    );

Map<String, dynamic> _$DistrictToJson(District instance) => <String, dynamic>{
      'id': instance.id,
      'division_id': instance.divisionId,
      'name': instance.name,
      'bn_name': instance.bnName,
      'lat': instance.lat,
      'long': instance.long,
    };
