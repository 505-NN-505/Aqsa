import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'gregorian.dart';
import 'hijri.dart';

part 'date.g.dart';

@JsonSerializable()
class Date extends Equatable {
  final String? readable;
  final String? timestamp;
  final Hijri? hijri;
  final Gregorian? gregorian;

  const Date({this.readable, this.timestamp, this.hijri, this.gregorian});

  factory Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);

  Map<String, dynamic> toJson() => _$DateToJson(this);

  Date copyWith({
    String? readable,
    String? timestamp,
    Hijri? hijri,
    Gregorian? gregorian,
  }) {
    return Date(
      readable: readable ?? this.readable,
      timestamp: timestamp ?? this.timestamp,
      hijri: hijri ?? this.hijri,
      gregorian: gregorian ?? this.gregorian,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [readable, timestamp, hijri, gregorian];
}
