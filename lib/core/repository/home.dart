import 'package:weather_app/core/models/location.dart';
import 'package:weather_app/core/service/apis/api_client.dart';
import 'package:weather_app/core/service/apis/api_result.dart';
import 'package:weather_app/core/service/exceptions/network_exceptions.dart';
import 'package:weather_app/core/service/prefs/shared_prefs.dart';

class HomeProvider {
  HomeProvider({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient();
  final ApiClient _apiClient;

  Future<ApiResult<dynamic>> getLocationByLatLng(
      double latitude, double longitude) async {
    try {
      var locationResponse =
          await _apiClient.locationSearchByLatLng(latitude, longitude);
      if (locationResponse.isEmpty) {
        return const ApiResult.failure(
            error:
                NetworkExceptions.unexpectedError('Could not find location'));
      }
      final location =
          Location.fromJson(locationResponse.first as Map<String, dynamic>);
      int woeid = location.woeid;

      await SharedPref.setCityValue(location.woeid);

      return ApiResult.success(data: woeid);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
  
}
