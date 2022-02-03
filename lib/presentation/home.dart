import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/components/snackbar.dart';
import 'package:weather_app/core/models/weather.dart';
import 'package:weather_app/core/service/exceptions/network_exceptions.dart';
import 'package:weather_app/core/service/navigator.dart';
import 'package:weather_app/presentation/forecast.dart';
import 'package:weather_app/presentation/search_location.dart';
import 'package:weather_app/providers/home_provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/ripple_effect.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key, this.weather}) : super(key: key);
  final Weather? weather;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(homeNotifierProvider.notifier).checkFirstRun();
    }, []);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ref.watch(homeNotifierProvider).when(
            idle: () {},
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
            data: (Weather data) {
              return WeatherAvailable(weatherData: data);
            },
            error: (error) {
              return Center(
                child: Text(
                  NetworkExceptions.getErrorMessage(error),
                  style: const TextStyle(
                      fontSize: 20, color: AppColors.textdarkBlueColor),
                ),
              );
            },
          ),
    );
  }
}

class WeatherAvailable extends HookConsumerWidget {
  const WeatherAvailable({Key? key, this.weatherData}) : super(key: key);
  final Weather? weatherData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;
    final isVisible = useState(false);
    final weather = useState(weatherData);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Container(
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('assets/Cloud-background.png'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        AppColors.backgroundColor.withOpacity(0.03),
                        BlendMode.dstIn,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 15.0,
                ),
                child: ListView(shrinkWrap: true, children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          var city = await NavigationService(context)
                              .navigateTransparentRoute(
                                  const SearchLocation(), -1.0, 0.0);
                          ref
                              .read(weatherNotifierProvider.notifier)
                              .fetchWeather(context, city);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.grey,
                          elevation: 4,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 16,
                          ),
                        ),
                        child: const Text('Search for places',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: AppColors.greyShade1,
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          isVisible.value = true;
                          ref
                              .read(weatherNotifierProvider.notifier)
                              .fetchWeatherWithGPS()
                              .then((value) => isVisible.value = false);
                        },
                        child: RippleAnimation(
                          color: AppColors.greyShade1,
                          minRadius: 20,
                          ripplesCount: 3,
                          repeat: true,
                          isVisible: isVisible.value,
                          child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: AppColors.grey,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 4),
                                    color: AppColors.black,
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: const Icon(
                                Icons.gps_fixed_outlined,
                                color: AppColors.greyShade1,
                              )),
                        ),
                      ),
                    ],
                  ),
                  // ref.watch(homeNotifierProvider).when(idle: () {
                  //   return const SizedBox();
                  // }, loading: () {
                  //   return Shimmer(
                  //     duration: const Duration(seconds: 3), //Default value
                  //     interval: const Duration(
                  //         seconds: 5), //Default value: Duration(seconds: 0)
                  //     color: Colors.white, //Default value
                  //     colorOpacity: 0, //Default value
                  //     enabled: true, //Default value
                  //     direction:
                  //         const ShimmerDirection.fromLTRB(), //Default Value
                  //     child: SizedBox(
                  //         width: size.width,
                  //         height: size.height,
                  //         child: InitialWeatherData(weather: weather)),
                  //   );
                  // }, data: (data) {
                  //   return RefreshWeatherData(weather: data);
                  // }, error: (error) {
                  //   WidgetsBinding.instance!.addPostFrameCallback((_) =>
                  //       CustomSnackBar.showErrorSnackBar(context,
                  //           message: NetworkExceptions.getErrorMessage(error),
                  //           snackBarBehavior: SnackBarBehavior.floating));
                  //   return InitialWeatherData(weather: weather);
                  // }),
                  ref.watch(weatherNotifierProvider).when(idle: () {
                    return InitialWeatherData(weather: weather);
                  }, loading: () {
                    return Shimmer(
                      duration: const Duration(seconds: 3), //Default value
                      interval: const Duration(
                          seconds: 5), //Default value: Duration(seconds: 0)
                      color: Colors.white, //Default value
                      colorOpacity: 0, //Default value
                      enabled: true, //Default value
                      direction:
                          const ShimmerDirection.fromLTRB(), //Default Value
                      child: SizedBox(
                          width: size.width,
                          height: size.height,
                          child: InitialWeatherData(weather: weather)),
                    );
                  }, data: (data) {
                    return RefreshWeatherData(weather: data);
                  }, error: (error) {
                    WidgetsBinding.instance!.addPostFrameCallback((_) =>
                        CustomSnackBar.showErrorSnackBar(context,
                            message: NetworkExceptions.getErrorMessage(error),
                            snackBarBehavior: SnackBarBehavior.floating));
                    return InitialWeatherData(weather: weather);
                  }),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RefreshWeatherData extends StatelessWidget {
  const RefreshWeatherData({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),
        SvgPicture.network(
          'https://www.metaweather.com/static/img/weather/${weather.consolidatedWeather[0].weatherStateAbbr}.svg',
          height: 150,
          width: 150,
        ),
        const SizedBox(height: 20),
        Center(
          child: RichText(
            text: TextSpan(
              text: weather.consolidatedWeather[0].theTemp.toStringAsFixed(0),
              style: const TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 144,
                  color: AppColors.greyShade1,
                  fontWeight: FontWeight.w500),
              children: const [
                TextSpan(
                  text: '°C',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 48,
                    color: AppColors.textBlueColor,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Text(weather.consolidatedWeather[0].weatherStateName,
              style: const TextStyle(
                  fontSize: 42,
                  color: AppColors.textBlueColor,
                  fontWeight: FontWeight.w600)),
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Today',
                style: TextStyle(
                    fontSize: 18,
                    color: AppColors.textdarkBlueColor,
                    fontWeight: FontWeight.w500)),
            const SizedBox(width: 16),
            const Text(
              '·',
              style: TextStyle(
                  fontSize: 18,
                  color: AppColors.textdarkBlueColor,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 16),
            Text(
                '${DateTime.now().day.toString()} / ${DateTime.now().month.toString()} / ${DateTime.now().year.toString()}',
                style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.textdarkBlueColor,
                    fontWeight: FontWeight.w500)),
          ],
        ),
        const SizedBox(height: 33),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on, color: AppColors.textdarkBlueColor),
            const SizedBox(width: 9),
            Text(weather.title,
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.textdarkBlueColor,
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
        const SizedBox(height: 40),
        RippleAnimation(
          color: AppColors.greyShade1,
          minRadius: 20,
          ripplesCount: 3,
          repeat: true,
          isVisible: true,
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.textdarkBlueColor,
              shape: BoxShape.circle,
            ),
            child: TextButton(
              onPressed: () {
                NavigationService(context).navigateTransparentRoute(
                    ForecastPage(weatherData: weather), 0.0, 1.0);
              },
              style: TextButton.styleFrom(
                shape: const CircleBorder(),
                primary: AppColors.greyShade1,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              ),
              child: const Icon(Icons.arrow_downward),
            ),
          ),
        ),
      ],
    );
  }
}

class InitialWeatherData extends StatelessWidget {
  const InitialWeatherData({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final ValueNotifier<Weather?> weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),
        SvgPicture.network(
          'https://www.metaweather.com/static/img/weather/${weather.value!.consolidatedWeather[0].weatherStateAbbr}.svg',
          height: 150,
          width: 150,
        ),
        const SizedBox(height: 20),
        Center(
          child: RichText(
            text: TextSpan(
              text: weather.value!.consolidatedWeather[0].theTemp
                  .toStringAsFixed(1),
              style: const TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 144,
                  color: AppColors.greyShade1,
                  fontWeight: FontWeight.w500),
              children: const [
                TextSpan(
                  text: '°C',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 48,
                    color: AppColors.textBlueColor,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Text(weather.value!.consolidatedWeather[0].weatherStateName,
              style: const TextStyle(
                  fontSize: 42,
                  color: AppColors.textBlueColor,
                  fontWeight: FontWeight.w600)),
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Today',
                style: TextStyle(
                    fontSize: 18,
                    color: AppColors.textdarkBlueColor,
                    fontWeight: FontWeight.w500)),
            const SizedBox(width: 16),
            const Text(
              '·',
              style: TextStyle(
                  fontSize: 18,
                  color: AppColors.textdarkBlueColor,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 16),
            Text(
                DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY)
                    .format(DateTime.now()),
                style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.textdarkBlueColor,
                    fontWeight: FontWeight.w500)),
          ],
        ),
        const SizedBox(height: 33),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on, color: AppColors.textdarkBlueColor),
            const SizedBox(width: 9),
            Text(weather.value!.title,
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.textdarkBlueColor,
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
        const SizedBox(height: 40),
        RippleAnimation(
          color: AppColors.greyShade1,
          minRadius: 20,
          ripplesCount: 3,
          repeat: true,
          isVisible: true,
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.textdarkBlueColor,
              shape: BoxShape.circle,
            ),
            child: TextButton(
              onPressed: () {
                NavigationService(context).navigateTransparentRoute(
                    ForecastPage(weatherData: weather.value), 0.0, 1.0);
              },
              style: TextButton.styleFrom(
                shape: const CircleBorder(),
                primary: AppColors.greyShade1,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              ),
              child: const Icon(Icons.arrow_downward),
            ),
          ),
        ),
      ],
    );
  }
}
