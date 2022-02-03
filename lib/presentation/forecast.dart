import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/components/forecast_container.dart';
import 'package:weather_app/components/highlight_container.dart';
import 'package:weather_app/core/models/weather.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ForecastPage extends HookConsumerWidget {
  const ForecastPage({Key? key, required this.weatherData}) : super(key: key);
  final Weather? weatherData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;
    final weather = useState(weatherData);
    return Scaffold(
        backgroundColor: AppColors.darkBackgroundColor,
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 40.0,
                horizontal: 15.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Forecast',
                      style: TextStyle(
                        color: AppColors.greyShade1,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                      )),
                  const SizedBox(height: 30.0),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        ForecastContainer(weather: weatherData, index: 1),
                        const SizedBox(width: 20),
                        ForecastContainer(weather: weatherData, index: 2),
                        const SizedBox(width: 20),
                        ForecastContainer(weather: weatherData, index: 3),
                        const SizedBox(width: 20),
                        ForecastContainer(weather: weatherData, index: 4),
                        const SizedBox(width: 20),
                        ForecastContainer(weather: weatherData, index: 5),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  const Text("Today's Highlights",
                      style: TextStyle(
                        color: AppColors.greyShade1,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                      )),
                  const SizedBox(height: 30.0),
                  HighlightContainer(
                      size: size,
                      label: 'Wind Status',
                      value: weather.value!.consolidatedWeather[0].windSpeed
                          .toStringAsFixed(1),
                      angle:
                          weather.value!.consolidatedWeather[0].windDirection,
                      unit: ' mph'),
                  const SizedBox(height: 20),
                  HighlightContainer(
                      size: size,
                      label: 'Humidity',
                      value: weather.value!.consolidatedWeather[0].humidity
                          .toString(),
                      unit: ' %'),
                  const SizedBox(height: 20),
                  HighlightContainer(
                      size: size,
                      label: 'Visibility',
                      value: weather.value!.consolidatedWeather[0].visibility
                          .toStringAsFixed(1),
                      unit: ' miles'),
                  const SizedBox(height: 20),
                  HighlightContainer(
                      size: size,
                      label: 'Air Pressure',
                      value: weather.value!.consolidatedWeather[0].airPressure
                          .toString(),
                      unit: ' mb'),
                ],
              ),
            ),
          ),
        ));
  }
}
