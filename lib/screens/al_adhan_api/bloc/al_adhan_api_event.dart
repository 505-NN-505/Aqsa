part of 'al_adhan_api_bloc.dart';

abstract class AlAdhanApiEvent extends Equatable {
  const AlAdhanApiEvent();

  @override
  List<Object> get props => [];
}

class GetTimings extends AlAdhanApiEvent {
  final String? latitude;
  final String? longitude;
  final String? calcMethod;
  final String? schoolMethod;
  const GetTimings({this.latitude = "23.7115253", this.longitude = "90.4111451", this.calcMethod = "1", this.schoolMethod = "0"});
}