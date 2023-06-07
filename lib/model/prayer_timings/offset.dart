import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'offset.g.dart';

@JsonSerializable()
class Offset extends Equatable {
  @JsonKey(name: 'Imsak')
  final int? imsak;
  @JsonKey(name: 'Fajr')
  final int? fajr;
  @JsonKey(name: 'Sunrise')
  final int? sunrise;
  @JsonKey(name: 'Dhuhr')
  final int? dhuhr;
  @JsonKey(name: 'Asr')
  final int? asr;
  @JsonKey(name: 'Maghrib')
  final int? maghrib;
  @JsonKey(name: 'Sunset')
  final int? sunset;
  @JsonKey(name: 'Isha')
  final int? isha;
  @JsonKey(name: 'Midnight')
  final int? midnight;

  const Offset({
    this.imsak,
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.sunset,
    this.isha,
    this.midnight,
  });

  factory Offset.fromJson(Map<String, dynamic> json) {
    return _$OffsetFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OffsetToJson(this);

  Offset copyWith({
    int? imsak,
    int? fajr,
    int? sunrise,
    int? dhuhr,
    int? asr,
    int? maghrib,
    int? sunset,
    int? isha,
    int? midnight,
  }) {
    return Offset(
      imsak: imsak ?? this.imsak,
      fajr: fajr ?? this.fajr,
      sunrise: sunrise ?? this.sunrise,
      dhuhr: dhuhr ?? this.dhuhr,
      asr: asr ?? this.asr,
      maghrib: maghrib ?? this.maghrib,
      sunset: sunset ?? this.sunset,
      isha: isha ?? this.isha,
      midnight: midnight ?? this.midnight,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      imsak,
      fajr,
      sunrise,
      dhuhr,
      asr,
      maghrib,
      sunset,
      isha,
      midnight,
    ];
  }
}
