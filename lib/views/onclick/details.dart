import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intern_weather/views/onclick/bottom_sheet.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:weather/weather.dart';

class DetailsPage extends ConsumerStatefulWidget {
  final Weather weather;
  const DetailsPage({super.key, required this.weather});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailsPageState();
}

class _DetailsPageState extends ConsumerState<DetailsPage> {
  final df = DateFormat("dd/mm/yy");
  @override
  Widget build(BuildContext context) {
    getDay(int a) {
      switch (a) {
        case 1:
          return "Monday";
        case 2:
          return "Tueday";
        case 3:
          return "Wednesday";
        case 4:
          return "Thursday";
        case 5:
          return "Friday";
        case 6:
          return "Saturday";
        case 7:
          return "Sunday";
        default:
          return "None";
      }
    }

    getMonth(int a) {
      switch (a) {
        case 1:
          return "January";
        case 2:
          return "Febuary";
        case 3:
          return "March";
        case 4:
          return "April";
        case 5:
          return "May";
        case 6:
          return "June";
        case 7:
          return "July";
        case 8:
          return "August";
        case 9:
          return "September";
        case 10:
          return "October";
        case 11:
          return "November";
        case 12:
          return "December";
        default:
          return "None";
      }
    }

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

    final weather = widget.weather;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text('${weather.areaName}'.toUpperCase()),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Container(
            height: 300.0,
            child: Stack(
              children: [
                
                Positioned(
                  child: Hero(
                    tag: getImage(weather),
                    child: Center(
                      child: Image(
                        image: AssetImage(getImage(weather)),
                        fit: BoxFit.cover,
                        width: 250.0,
                        height: 250.0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 150.0,
                  right: MediaQuery.of(context).size.width / 2 - 80,
                  child: Text(
                    '${weather.temperature!.celsius!.toInt()}°',
                    style: GoogleFonts.archivoNarrow().copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 100.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Center(
            child: Text(
              'It\'s ${weather.weatherDescription}.',
              style: GoogleFonts.poppins().copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Center(
            child: Text(
              '${getDay(weather.date!.weekday)},  ${weather.date!.day} ${getMonth(weather.date!.month)}',
              style: GoogleFonts.poppins().copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            height: MediaQuery.of(context).size.height / 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: IconButton(
                    onPressed: () => showMaterialModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      builder: (context) => BottomSheetView(weather: weather)
                    ),
                    icon: const RotatedBox(
                        quarterTurns: 1, child: Icon(Icons.arrow_back_ios_new)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 20.0,
                    top: 10.0,
                  ),
                  child: Text(
                    'Weather Information',
                    style: GoogleFonts.archivoNarrow().copyWith(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xE8241B4C),
                    ),
                  ),
                ),
                Row(
                  children: [
                    SmallWidget(
                      imageUrl: 'assets/icons/temperature.png',
                      cateName: 'Feels Like',
                      value: '${weather.tempFeelsLike!.celsius!.toInt()}°',
                    ),
                    SmallWidget(
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
                  children: [
                    SmallWidget(
                      imageUrl: 'assets/icons/humidity.png',
                      cateName: 'Feels Like',
                      value: '${weather.humidity!.toInt()} %',
                    ),
                    SmallWidget(
                      imageUrl: 'assets/icons/cloudy.png',
                      cateName: 'Precipitation',
                      value: '${weather.cloudiness} %',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SmallWidget extends StatelessWidget {
  final String imageUrl;
  final String cateName;
  final String value;
  const SmallWidget(
      {super.key,
      required this.imageUrl,
      required this.cateName,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      width: MediaQuery.of(context).size.width / 2 - 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xE8241B4C).withOpacity(.06),
            radius: 30.0,
            child: Image(
              width: 40.0,
              height: 40.0,
              fit: BoxFit.cover,
              image: AssetImage(imageUrl),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cateName,
                style: GoogleFonts.oswald().copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xE8241B4C).withOpacity(.4),
                  fontSize: 14.0,
                ),
              ),
              Text(
                value,
                style: GoogleFonts.oswald().copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xE8241B4C),
                  fontSize: 16.0,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
