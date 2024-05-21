import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intern_weather/services/http_weather.dart';
import 'package:weather/weather.dart';

class ForecastWidget extends ConsumerStatefulWidget {
  const ForecastWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForecastWidgetState();
}

class _ForecastWidgetState extends ConsumerState<ForecastWidget> {
  final WeatherFactory _wf = WeatherFactory(APIKeys.openWeatherAPIKey);
  List<Weather> list = [];
  @override
  void initState() {
    super.initState();
    _wf.fiveDayForecastByCityName('naypyidaw').then((value) {
      setState(() {
        list = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      height: 210.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          final forecast = list[index];
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

          return StretchWeatherWidget(
            time: "${forecast.date!.hour}:00",
            temp: "${forecast.temperature?.celsius?.toInt()}°C",
                // df.format((forecast.date!)),
            image: getImage(),
          );
        },
      ),
    );
  }
}


class StretchWeatherWidget extends StatelessWidget {
  final String image;
  final String temp;
  final String time;
  const StretchWeatherWidget(
      {super.key, required this.image, required this.temp, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const[
          BoxShadow(
            offset: Offset(3,3),
            blurRadius: 6.0,
            color: Colors.black12,
          )
        ],
        borderRadius: BorderRadius.circular(10.0)
      ),
      margin: const EdgeInsets.only(top:10.0,left: 10.0,bottom: 10.0),
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            time,
            style: GoogleFonts.archivoNarrow().copyWith(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              color: const Color(0xE8241B4C),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          CircleAvatar(
            radius: 25.0,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(.05),
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.cover,
              width: 30.0,
              height: 30.0,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          
          Text(
            temp,
            style: GoogleFonts.archivoNarrow().copyWith(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: const Color(0xE8241B4C),
            ),
          ),
        ],
      ),
    );
  }
}
