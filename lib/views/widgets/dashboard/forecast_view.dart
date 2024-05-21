import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern_weather/services/http_weather.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

import 'weather_widget.dart';

class ForecastView extends ConsumerStatefulWidget {
  const ForecastView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForecastViewState();
}

class _ForecastViewState extends ConsumerState<ForecastView> {
  final df = DateFormat('dd/mm/yy');

  final WeatherFactory _wf = WeatherFactory(APIKeys.openWeatherAPIKey);
  List<Weather> fiveDayList = [];

  @override
  void initState() {
    _wf.fiveDayForecastByCityName("naypyidaw").then((value) {
      setState(() {
        fiveDayList = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      height: 200.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: fiveDayList.length,
        itemBuilder: (BuildContext context, int index) {
          final forecast = fiveDayList[index];
          String getImage() {
            if (forecast.weatherMain == 'Clouds' &&
                (forecast.date!.hour >= 6 && forecast.date!.hour <= 18)) {
              return "assets/icons/cloudy.png";
            } else if (forecast.weatherMain == 'Rain') {
              return "assets/icons/rain.png";
            } else if (forecast.weatherMain == 'Clouds' &&
                (forecast.date!.hour >= 19 && forecast.date!.hour <= 5)) {
              return "assets/icons/night.png";
            } else if (forecast.weatherMain == 'Clear') {
              return "assets/icons/sunny.png";
            } else {
              return "assets/icons/night.png";
            }
          }

          return WeatherWidget(
            time: "${forecast.date!.hour}:00" "\n${forecast.weatherMain}",
            temp: "${forecast.temperature?.celsius?.toInt()}°C",
                // df.format((forecast.date!)),
            image: getImage(),
          );
        },
      ),
    );
  }
}
