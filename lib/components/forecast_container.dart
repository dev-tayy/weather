import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/models/weather.dart';
import 'package:weather_app/utils/constants.dart';

class ForecastContainer extends StatelessWidget {
  const ForecastContainer(
      {Key? key, required this.weather, required this.index})
      : super(key: key);
  final Weather? weather;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blueContainerColor,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 22),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY)
                .format(weather!.consolidatedWeather[index].applicableDate),
            style: const TextStyle(
                fontSize: 16,
                color: AppColors.greyShade1,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 15),
          SvgPicture.network(
              'https://www.metaweather.com/static/img/weather/${weather!.consolidatedWeather[index].weatherStateAbbr}.svg',
              height: 55,
              width: 55),
          const SizedBox(height: 30),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${weather!.consolidatedWeather[index].maxTemp.toStringAsFixed(1)}°C',
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.greyShade1,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                '${weather!.consolidatedWeather[index].minTemp.toStringAsFixed(1)}°C',
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.textBlueColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
