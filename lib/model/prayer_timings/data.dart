import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'date.dart';
import 'meta.dart';
import 'timings.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Equatable {
  final Timings? timings;
  final Date? date;
  final Meta? meta;

  const Data({this.timings, this.date, this.meta});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    Timings? timings,
    Date? date,
    Meta? meta,
  }) {
    return Data(
      timings: timings ?? this.timings,
      date: date ?? this.date,
      meta: meta ?? this.meta,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [timings, date, meta];
}
