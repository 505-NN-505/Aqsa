import '../../../model/prayer_timings/prayer_timings.dart';
import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();
  Future<PrayerTimings> fetchData(String latitude, String longitude, String calcMethod) {
    return _provider.fetchTimings(latitude, longitude, calcMethod);
  }
}

class NetworkError extends Error {}