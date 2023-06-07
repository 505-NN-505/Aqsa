import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'designation.g.dart';

@JsonSerializable()
class Designation extends Equatable {
  final String? abbreviated;
  final String? expanded;

  const Designation({this.abbreviated, this.expanded});

  factory Designation.fromJson(Map<String, dynamic> json) {
    return _$DesignationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DesignationToJson(this);

  Designation copyWith({
    String? abbreviated,
    String? expanded,
  }) {
    return Designation(
      abbreviated: abbreviated ?? this.abbreviated,
      expanded: expanded ?? this.expanded,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [abbreviated, expanded];
}
