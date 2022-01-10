import 'package:flutter/cupertino.dart';
import 'package:weather_app/utils/constants.dart';

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
