import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'month.g.dart';

@JsonSerializable()
class Month extends Equatable {
  final int? number;
  final String? en;
  final String? ar;

  const Month({this.number, this.en, this.ar});

  factory Month.fromJson(Map<String, dynamic> json) => _$MonthFromJson(json);

  Map<String, dynamic> toJson() => _$MonthToJson(this);

  Month copyWith({
    int? number,
    String? en,
    String? ar,
  }) {
    return Month(
      number: number ?? this.number,
      en: en ?? this.en,
      ar: ar ?? this.ar,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [number, en, ar];
}
