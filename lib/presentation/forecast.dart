import 'package:flutter/material.dart';
import 'package:weather_app/components/forecast_container.dart';
import 'package:weather_app/components/highlight_container.dart';
import 'package:weather_app/utils/constants.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                    child: Row(
                      children: const [
                        ForecastContainer(),
                        SizedBox(width: 20),
                        ForecastContainer(),
                        SizedBox(width: 20),
                        ForecastContainer(),
                        SizedBox(width: 20),
                        ForecastContainer(),
                        SizedBox(width: 20),
                        ForecastContainer(),
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
                      value: '7',
                      unit: 'mph'),
                  const SizedBox(height: 20),
                  HighlightContainer(
                      size: size, label: 'Humidity', value: '70', unit: ' %'),
                  const SizedBox(height: 20),
                  HighlightContainer(
                      size: size,
                      label: 'Visibility',
                      value: '6,4',
                      unit: ' miles'),
                  const SizedBox(height: 20),
                  HighlightContainer(
                      size: size,
                      label: 'Air Pressure',
                      value: '994',
                      unit: ' mb'),
                ],
              ),
            ),
          ),
        ));
  }
}