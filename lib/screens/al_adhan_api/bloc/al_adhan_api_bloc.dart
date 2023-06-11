import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../model/prayer_timings/prayer_timings.dart';
import '../controller/api_repositories.dart';

part 'al_adhan_api_event.dart';
part 'al_adhan_api_state.dart';

class AlAdhanApiBloc extends Bloc<AlAdhanApiEvent, AlAdhanApiState> {
  final ApiRepository apiRepository;
  AlAdhanApiBloc({required this.apiRepository}) : super(AlAdhanApiInitial()) {
    // TODO: implement event handler
    on<GetTimings>((event, emit) async {
      try {
        emit(AlAdhanApiLoading());
        final mList = await apiRepository.fetchData(
            event.latitude!, event.longitude!, event.calcMethod!, event.schoolMethod!);
        emit(AlAdhanApiLoaded(mList));
      } on NetworkError {
        emit(AlAdhanApiError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
