import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants.dart';

class HighlightContainer extends StatelessWidget {
  const HighlightContainer(
      {Key? key,
      required this.label,
      required this.size,
      required this.unit,
      required this.value})
      : super(key: key);

  final Size size;
  final String label;
  final String value;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.blueContainerColor,
        width: size.width,
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(label,
                style: const TextStyle(
                  color: AppColors.greyShade1,
                  fontSize: 16.0,
                )),
            RichText(
              text: TextSpan(
                text: value,
                style: const TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 64,
                    color: AppColors.greyShade1,
                    fontWeight: FontWeight.w700),
                children: [
                  TextSpan(
                    text: unit,
                    style: const TextStyle(
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
            label == 'Wind Status'
                ? Row(
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
                : label == 'Humidity'
                    ? const Text('Lol')
                    : const SizedBox()
          ],
        ));
  }
}