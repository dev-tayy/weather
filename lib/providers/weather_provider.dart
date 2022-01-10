import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/components/snackbar.dart';
import 'package:weather_app/core/models/weather.dart';
import 'package:weather_app/core/repository/weather.dart';
import 'package:weather_app/core/service/apis/api_result.dart';
import 'package:weather_app/core/service/exceptions/network_exceptions.dart';
import 'package:weather_app/providers/weather_state.dart';

final weatherRepositoryProvider =
    Provider<WeatherRepository>((ref) => WeatherRepository());

final weatherNotifierProvider = StateNotifierProvider(
    (ref) => WeatherNotifierProvider(ref.watch(weatherRepositoryProvider)));

class WeatherNotifierProvider extends StateNotifier<WeatherState> {
  WeatherNotifierProvider(this.weatherRepository)
      : super(const WeatherState.idle());
  final WeatherRepository weatherRepository;

  Future fetchWeather(BuildContext context, String city) async {
    state = const WeatherState.loading();
    ApiResult apiResult = await weatherRepository.getWeatherBySearch(city);
    apiResult.when(success: (data) {
      var weather = Weather.fromJson(data);
      state = WeatherState.data(data: weather);
      print(state);
    }, failure: (error) {
      state = WeatherState.error(error: error);
      print(state);
      CustomSnackBar.showErrorSnackBar(
        context,
        message: NetworkExceptions.getErrorMessage(error),
        milliseconds: 2000,
      );
    });
  }
}
