import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern_weather/views/widgets/onclick/bottom_forecast_widget.dart';
import '../widgets/onclick/small_widget.dart';
import 'package:weather/weather.dart';

class BottomSheetView extends ConsumerWidget {
  final Weather weather;
  const BottomSheetView({super.key, required this.weather});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Center(
                child: Container(
              margin: const EdgeInsets.all(10.0),
              width: 100.0,
              height: 5.0,
              color: Colors.black,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomSheetSmallWidget(
                  imageUrl: 'assets/icons/temperature.png',
                  cateName: 'Feels Like',
                  value: '${weather.tempFeelsLike!.celsius!.toInt()}°',
                ),
                BottomSheetSmallWidget(
                  imageUrl: 'assets/icons/wind.png',
                  cateName: 'Wind Speed',
                  value: '${weather.windSpeed} Km/h',
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomSheetSmallWidget(
                  imageUrl: 'assets/icons/humidity.png',
                  cateName: 'Feels Like',
                  value: '${weather.humidity!.toInt()} %',
                ),
                BottomSheetSmallWidget(
                  imageUrl: 'assets/icons/cloudy.png',
                  cateName: 'Precipitation',
                  value: '${weather.cloudiness} %',
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomSheetSmallWidget(
                  imageUrl: 'assets/icons/high-temperature.png',
                  cateName: 'Max Temp',
                  value: "${weather.tempMax!.celsius!.toInt()}°",
                ),
                BottomSheetSmallWidget(
                  imageUrl: 'assets/icons/low-temperature.png',
                  cateName: 'Min Temp',
                  value: '${weather.tempMax!.celsius!.toInt()}°',
                ),
              ],
            ),
      
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0,top: 10.0),
              child: const Divider(
                thickness: 2.0,
                color: Colors.black12,
              ),
            ),
            
            const ForecastWidget(),
            
          ],
        ),
      ),
    );
  }
}
