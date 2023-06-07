import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'location.dart';
import 'params.dart';

part 'method.g.dart';

@JsonSerializable()
class Method extends Equatable {
  final int? id;
  final String? name;
  final Params? params;
  final Location? location;

  const Method({this.id, this.name, this.params, this.location});

  factory Method.fromJson(Map<String, dynamic> json) {
    return _$MethodFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MethodToJson(this);

  Method copyWith({
    int? id,
    String? name,
    Params? params,
    Location? location,
  }) {
    return Method(
      id: id ?? this.id,
      name: name ?? this.name,
      params: params ?? this.params,
      location: location ?? this.location,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, params, location];
}
