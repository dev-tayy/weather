import 'package:flutter/material.dart';
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
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40.0,
              horizontal: 15.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Container(
                    color: AppColors.blueContainerColor,
                    width: size.width,
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('Wind status',
                            style: TextStyle(
                              color: AppColors.greyShade1,
                              fontSize: 16.0,
                            )),
                        RichText(
                          text: const TextSpan(
                            text: '7',
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 64,
                                color: AppColors.greyShade1,
                                fontWeight: FontWeight.w700),
                            children: [
                              TextSpan(
                                text: 'mph',
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 36,
                                  color: AppColors.greyShade1,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                width: 20,
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: AppColors.grey,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.location_on,
                                  color: AppColors.greyShade1,
                                  size: 9,
                                )),
                            const SizedBox(width: 10.0),
                            const Text(
                              'WSW',
                              style: TextStyle(
                                color: AppColors.greyShade1,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}

class ForecastContainer extends StatelessWidget {
  const ForecastContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blueContainerColor,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 22),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Tomorrow',
            style: TextStyle(fontSize: 16, color: AppColors.greyShade1),
          ),
          const SizedBox(height: 10),
          const Image(
            image: AssetImage('assets/Shower.png'),
            width: 55,
            height: 60,
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                '16°C',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.greyShade1,
                ),
              ),
              SizedBox(width: 16),
              Text(
                '11°C',
                style: TextStyle(
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
