import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'city_search_box.dart';
import 'current_weather.dart';
import 'hourly_weather.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  // const WeatherPage({super.key, required this.city});
  // final String city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration:  BoxDecoration(
          color: Theme.of(context).backgroundColor,
        ),
        child:  SafeArea(
          child: ListView(
            
            children:const [
              SizedBox(height: 20.0,),
              Expanded(child: CitySearchBox()),
              SizedBox(height: 50.0,),
              CurrentWeather(),
              SizedBox(height: 20.0,),
              Expanded(child: HourlyWeather()),
              SizedBox(height: 20.0,),
            ],
          ),
        ),
      ),
    );
  }
}
