import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/core/models/weather.dart';
import 'package:weather_app/core/repository/home.dart';
import 'package:weather_app/core/repository/weather.dart';
import 'package:weather_app/core/service/exceptions/network_exceptions.dart';
import 'package:weather_app/core/service/prefs/shared_prefs.dart';
import 'package:weather_app/providers/weather_state.dart';
import 'package:weather_app/core/service/geolocator.dart' as geolocator;

final homeProvider = Provider<HomeProvider>((ref) => HomeProvider());

final weatherRepositoryProvider =
    Provider<WeatherRepository>((ref) => WeatherRepository());

final homeNotifierProvider =
    StateNotifierProvider<HomeNotifierProvider, WeatherState<Weather>>((ref) =>
        HomeNotifierProvider(
            homeProvider: ref.watch(homeProvider),
            weatherRepository: ref.watch(weatherRepositoryProvider)));

class HomeNotifierProvider extends StateNotifier<WeatherState<Weather>> {
  HomeNotifierProvider(
      {required this.homeProvider, required this.weatherRepository})
      : super(const WeatherState.idle());

  final HomeProvider homeProvider;
  final WeatherRepository weatherRepository;

  Future checkFirstRun() async {
    bool checkFirstRun;
    state = const WeatherState.loading();

    try {
      await SharedPref.getFirstRunValue().then((value) async {
        checkFirstRun = value;
        if (!checkFirstRun) {
          await fetchWeatherWithGPS();
        } else {
          await SharedPref.getCityValue('woeid').then((value) async {
            final weatherResult =
                await weatherRepository.getWeatherBySearch(value);
            weatherResult.when(success: (data) {
              var weather = Weather.fromJson(data);
              state = WeatherState.data(data: weather);
            }, failure: (error) {
              state = WeatherState.error(error: error);
            });
          });
        }
      });

      await SharedPref.setFirstRun(false);
    } catch (e) {
      state = WeatherState.error(
          error: NetworkExceptions.unexpectedError(e.toString()));
    }
  }

  Future fetchWeatherWithGPS() async {
    try {
      print(state);
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
