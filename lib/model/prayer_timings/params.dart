import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'params.g.dart';

@JsonSerializable()
class Params extends Equatable {
  @JsonKey(name: 'Fajr')
  final int? fajr;
  @JsonKey(name: 'Isha')
  final int? isha;

  const Params({this.fajr, this.isha});

  factory Params.fromJson(Map<String, dynamic> json) {
    return _$ParamsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ParamsToJson(this);

  Params copyWith({
    int? fajr,
    int? isha,
  }) {
    return Params(
      fajr: fajr ?? this.fajr,
      isha: isha ?? this.isha,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [fajr, isha];
}
