import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'district.g.dart';

@JsonSerializable()
class District extends Equatable {
  final String? id;
  @JsonKey(name: 'division_id')
  final String? divisionId;
  final String? name;
  @JsonKey(name: 'bn_name')
  final String? bnName;
  final String? lat;
  final String? long;

  const District({
    this.id,
    this.divisionId,
    this.name,
    this.bnName,
    this.lat,
    this.long,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return _$DistrictFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DistrictToJson(this);

  District copyWith({
    String? id,
    String? divisionId,
    String? name,
    String? bnName,
    String? lat,
    String? long,
  }) {
    return District(
      id: id ?? this.id,
      divisionId: divisionId ?? this.divisionId,
      name: name ?? this.name,
      bnName: bnName ?? this.bnName,
      lat: lat ?? this.lat,
      long: long ?? this.long,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, divisionId, name, bnName, lat, long];
}
