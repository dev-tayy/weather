import 'package:weather_app/core/models/location.dart';
import 'package:weather_app/core/service/apis/api_client.dart';
import 'package:weather_app/core/service/apis/api_result.dart';
import 'package:weather_app/core/service/exceptions/network_exceptions.dart';

class WeatherRepository {
  WeatherRepository({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();
  final ApiClient _apiClient;

  Future<ApiResult<dynamic>> getLocationByCity(String? city) async {
    try {
      var locationResponse = await _apiClient.locationSearchByCity(city);
      if (locationResponse.isEmpty) {
        return const ApiResult.failure(
            error:
                NetworkExceptions.unexpectedError('Could not find location'));
      }
      final location =
          Location.fromJson(locationResponse.first as Map<String, dynamic>);
      int woeid = location.woeid;

      return ApiResult.success(data: woeid);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<dynamic>> getWeatherBySearch(int? woeid) async {
    try {
      var weatherResponse = await _apiClient.getWeather(woeid);
      if (weatherResponse.isEmpty) {
        return const ApiResult.failure(
            error: NetworkExceptions.unexpectedError(
                'Could not find current weather'));
      }
      final weather = weatherResponse;
      return ApiResult.success(data: weather);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
