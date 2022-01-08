import 'package:flutter/material.dart';
import 'package:weather_app/core/service/navigator.dart';
import 'package:weather_app/presentation/forecast.dart';
import 'package:weather_app/presentation/search_location.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/ripple_effect.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SizedBox(
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
                vertical: 40.0,
                horizontal: 15.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          NavigationService(context).navigateTransparentRoute(
                              const SearchLocation(), -1.0, 0.0);
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
                      Container(
                          width: 40,
                          height: 40,
                          //  padding: const EdgeInsets.all(9),
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
                    ],
                  ),
                  const SizedBox(height: 50),
                  const Image(
                    image: AssetImage('assets/Shower.png'),
                    width: 150,
                    height: 175,
                  ),
                  const SizedBox(height: 50),
                  RichText(
                    text: const TextSpan(
                      text: '15',
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 144,
                          color: AppColors.greyShade1,
                          fontWeight: FontWeight.w500),
                      children: [
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
                  const SizedBox(height: 20),
                  const Text('Shower',
                      style: TextStyle(
                          fontSize: 42,
                          color: AppColors.textBlueColor,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Today',
                          style: TextStyle(
                              fontSize: 18,
                              color: AppColors.textdarkBlueColor,
                              fontWeight: FontWeight.w500)),
                      SizedBox(width: 16),
                      Text('·',
                          style: TextStyle(
                              fontSize: 18,
                              color: AppColors.textdarkBlueColor,
                              fontWeight: FontWeight.w500)),
                      SizedBox(width: 16),
                      Text('Fri 5 Jun',
                          style: TextStyle(
                              fontSize: 18,
                              color: AppColors.textdarkBlueColor,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const SizedBox(height: 33),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.location_on,
                          color: AppColors.textdarkBlueColor),
                      SizedBox(width: 9),
                      Text('Helsinki',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.textdarkBlueColor,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                  const Expanded(child: SizedBox(height: 20)),
                  RippleAnimation(
                    color: AppColors.greyShade1,
                    minRadius: 20,
                    ripplesCount: 3,
                    repeat: true,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.textdarkBlueColor,
                        shape: BoxShape.circle,
                      ),
                      child: TextButton(
                        onPressed: () {
                          NavigationService(context).navigateTransparentRoute(
                              const ForecastPage(), 0.0, 1.0);
                        },
                        style: TextButton.styleFrom(
                          shape: const CircleBorder(),
                          primary: AppColors.greyShade1,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                        ),
                        child: const Icon(Icons.arrow_downward),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
