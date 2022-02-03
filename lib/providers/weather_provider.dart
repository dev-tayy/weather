import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/core/models/weather.dart';
import 'package:weather_app/core/repository/home.dart';
import 'package:weather_app/core/repository/weather.dart';
import 'package:weather_app/core/service/exceptions/network_exceptions.dart';
import 'package:weather_app/providers/weather_state.dart';
import 'package:weather_app/core/service/geolocator.dart' as geolocator;

final weatherRepositoryProvider =
    Provider<WeatherRepository>((ref) => WeatherRepository());

final homeProvider = Provider<HomeProvider>((ref) => HomeProvider());

final weatherNotifierProvider =
    StateNotifierProvider<WeatherNotifierProvider, WeatherState<Weather>>(
  (ref) => WeatherNotifierProvider(
      ref.watch(weatherRepositoryProvider), ref.watch(homeProvider)),
);

class WeatherNotifierProvider extends StateNotifier<WeatherState<Weather>> {
  WeatherNotifierProvider(this.weatherRepository, this.homeProvider)
      : super(const WeatherState.idle());
  final WeatherRepository weatherRepository;
  final HomeProvider homeProvider;

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

  Future<void> fetchWeatherWithGPS() async {
    try {
      Position? position;

      await geolocator.Locator.determinePosition().then((value) async {
        position = value;

        if (position == null) {
          state = const WeatherState.error(
              error:
                  NetworkExceptions.unexpectedError('Could not find location'));
          return;
        }

        final locationResult = await homeProvider.getLocationByLatLng(
          position!.latitude,
          position!.longitude,
        );

        locationResult.when(success: (woeid) async {
          final weatherResult =
              await weatherRepository.getWeatherBySearch(woeid);
          weatherResult.when(success: (data) {
            var weather = Weather.fromJson(data);
            state = WeatherState.data(data: weather);
          }, failure: (error) {
            state = WeatherState.error(error: error);
          });
        }, failure: (error) {
          state = WeatherState.error(error: error);
        });
      });
    } catch (e) {
      state = WeatherState.error(
          error: NetworkExceptions.unexpectedError(e.toString()));
    }
  }
}
