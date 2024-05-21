import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intern_weather/views/onclick/details.dart';
import 'package:weather/weather.dart';

import '../../../services/http_weather.dart';

class TemperatureClass extends ConsumerStatefulWidget {
  const TemperatureClass({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TemperatureClassState();
}

class _TemperatureClassState extends ConsumerState<TemperatureClass> {
  final WeatherFactory _wf = WeatherFactory(APIKeys.openWeatherAPIKey);
  Weather? weather;


  @override
  void initState() {
    super.initState();

    _wf.currentWeatherByCityName("naypyidaw").then((value) {
      setState(() {
        weather = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String getImage(Weather? weather) {
      if (weather?.weatherMain == 'Clouds') {
        return "assets/icons/cloudy.png";
      } else if (weather?.weatherMain == 'Rain') {
        return "assets/icons/rain.png";
      } else if (weather?.weatherMain == 'Clouds') {
        return "assets/icons/night.png";
      } else if (weather?.weatherMain == 'Clear') {
        return "assets/icons/sunny.png";
      } else {
        return "assets/icons/night.png";
      }
    }

    return Column(
      children: [
        Hero(
          tag: getImage(weather),
          child: Center(
            child: Image(
              image: AssetImage(getImage(weather)),
              fit: BoxFit.cover,
              width: 200.0,
              height: 200.0,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              Text(
                '${weather?.temperature!.celsius!.toInt()}°',
                style: GoogleFonts.archivoNarrow().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 110.0,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60.0,
                  ),
                  Text(
                    '${weather?.weatherDescription}'.toUpperCase(),
                    style: GoogleFonts.oswald().copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "H.  " '${weather?.tempMax!.celsius!.toInt()}°',
                        style: GoogleFonts.archivoNarrow().copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        width: 2.0,
                        height: 20.0,
                        color: Theme.of(context).primaryColor,
                      ),
                      Text(
                        "L.  " '${weather?.tempMin!.celsius!.toInt()}°',
                        style: GoogleFonts.archivoNarrow().copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              Text(
                "${weather?.areaName}".toUpperCase() +
                    " | ${weather?.country}".toUpperCase(),
                // + df.format(weather?),

                style: GoogleFonts.oswald().copyWith(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) =>  DetailsPage(
                        weather: weather!,
                      )));
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
