import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'prayer_timings.g.dart';

@JsonSerializable()
class PrayerTimings extends Equatable {
  final int? code;
  final String? status;
  final Data? data;

  const PrayerTimings({this.code, this.status, this.data});

  factory PrayerTimings.fromJson(Map<String, dynamic> json) {
    return _$PrayerTimingsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PrayerTimingsToJson(this);

  PrayerTimings copyWith({
    int? code,
    String? status,
    Data? data,
  }) {
    return PrayerTimings(
      code: code ?? this.code,
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [code, status, data];
}
