import 'package:dio/dio.dart';

class ApiClient {
  static const String _baseUrl = 'https://www.metaweather.com/api';
  final Dio _dio;
  ApiClient({Dio? dio}) : _dio = dio ?? Dio(BaseOptions(baseUrl: _baseUrl));

  Future<List> locationSearchByCity(String? query) async {
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

  Future<List> locationSearchByLatLng(double latitude, double longitude) async {
    String url = '/location/search';
    String latlong = '$latitude,$longitude';
    try {
      final response =
          await _dio.get(url, queryParameters: {'lattlong': latlong});
      return response.data as List;
    } on FormatException {
      throw const FormatException("Bad response format 👎");
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getWeather(int? woeid) async {
    String url = '/location/$woeid';
    try {
      final response = await _dio.get(url);
      return response.data as Map<String, dynamic>;
    } on FormatException {
      throw const FormatException("Bad response format 👎");
    } catch (e) {
      rethrow;
    }
  }
}
