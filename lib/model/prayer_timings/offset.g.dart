// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Offset _$OffsetFromJson(Map<String, dynamic> json) => Offset(
      imsak: json['Imsak'] as int?,
      fajr: json['Fajr'] as int?,
      sunrise: json['Sunrise'] as int?,
      dhuhr: json['Dhuhr'] as int?,
      asr: json['Asr'] as int?,
      maghrib: json['Maghrib'] as int?,
      sunset: json['Sunset'] as int?,
      isha: json['Isha'] as int?,
      midnight: json['Midnight'] as int?,
    );

Map<String, dynamic> _$OffsetToJson(Offset instance) => <String, dynamic>{
      'Imsak': instance.imsak,
      'Fajr': instance.fajr,
      'Sunrise': instance.sunrise,
      'Dhuhr': instance.dhuhr,
      'Asr': instance.asr,
      'Maghrib': instance.maghrib,
      'Sunset': instance.sunset,
      'Isha': instance.isha,
      'Midnight': instance.midnight,
    };
