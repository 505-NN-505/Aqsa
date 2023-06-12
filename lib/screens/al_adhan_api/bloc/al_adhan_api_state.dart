part of 'al_adhan_api_bloc.dart';

abstract class AlAdhanApiState extends Equatable {
  const AlAdhanApiState();
  
  @override
  List<Object> get props => [];
}

class AlAdhanApiInitial extends AlAdhanApiState {}

class AlAdhanApiLoading extends AlAdhanApiState {}

class AlAdhanApiLoaded extends AlAdhanApiState {
  final PrayerTimings model;
  const AlAdhanApiLoaded(this.model);
}

class AlAdhanApiError extends AlAdhanApiState {
  final String? message;
  const AlAdhanApiError(this.message);
}
