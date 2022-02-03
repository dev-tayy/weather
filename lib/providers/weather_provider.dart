import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/core/models/weather.dart';
import 'package:weather_app/core/repository/weather.dart';
import 'package:weather_app/core/service/exceptions/network_exceptions.dart';
import 'package:weather_app/providers/weather_state.dart';

final weatherRepositoryProvider =
    Provider<WeatherRepository>((ref) => WeatherRepository());

final weatherNotifierProvider =
    StateNotifierProvider<WeatherNotifierProvider, WeatherState<Weather>>(
        (ref) => WeatherNotifierProvider(ref.watch(weatherRepositoryProvider)));

class WeatherNotifierProvider extends StateNotifier<WeatherState<Weather>> {
  WeatherNotifierProvider(this.weatherRepository)
      : super(const WeatherState.idle());
  final WeatherRepository weatherRepository;

  Future<void> fetchWeather(BuildContext context, String city) async {
    state = const WeatherState.loading();
    final locationResult = await weatherRepository.getLocationByCity(city);
    locationResult.when(success: (woeid) async {
      final weatherResult = await weatherRepository.getWeatherBySearch(woeid);
      weatherResult.when(success: (data) {
        var weather = Weather.fromJson(data);
        state = WeatherState.data(data: weather);
      }, failure: (error) {
        state = WeatherState.error(error: error);
      });
    }, failure: (error) {
      state = WeatherState.error(error: error);
    });
  }
}
