import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'district.dart';

part 'districts_info.g.dart';

@JsonSerializable()
class DistrictsInfo extends Equatable {
  final List<District>? districts;

  const DistrictsInfo({this.districts});

  factory DistrictsInfo.fromJson(Map<String, dynamic> json) {
    return _$DistrictsInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DistrictsInfoToJson(this);

  DistrictsInfo copyWith({
    List<District>? districts,
  }) {
    return DistrictsInfo(
      districts: districts ?? this.districts,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [districts];
}
