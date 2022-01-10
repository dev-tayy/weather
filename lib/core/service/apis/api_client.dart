import 'package:dio/dio.dart';

class ApiClient {
  static const String _baseUrl = 'https://www.metaweather.com/api';
  final Dio _dio;
  ApiClient({Dio? dio}) : _dio = dio ?? Dio(BaseOptions(baseUrl: _baseUrl));

  Future<List> locationSearch(String query) async {
    String url = '/location/search';
    try {
      final response = await _dio.get(url, queryParameters: {'query': query});
     
      return response.data as List;
    } on FormatException {
      throw const FormatException("Bad response format 👎");
    } catch (e) {
      rethrow;
    }
  }

  Future<List> getWeather(int woeid) async {
    String url = '/location/$woeid';
    try {
      final response = await _dio.get(url);
      return response.data['consolidated_weather'] as List;
    } on FormatException {
      throw const FormatException("Bad response format 👎");
    } catch (e) {
      rethrow;
    }
  }
}
