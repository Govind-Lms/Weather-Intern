import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intern_weather/views/widgets/dashboard/forecast_view.dart';
import 'package:intern_weather/views/widgets/dashboard/temp_view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        // elevation: 0.0,
        title: Text(
          'Weather App'.toUpperCase(),
          style: GoogleFonts.oswald().copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          IconButton(onPressed: (){
          }, icon: const Icon(Icons.dark_mode),iconSize: 30.0,),
          const SizedBox(
            width: 10.0,
          ),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: const Column(
        children: [
          TemperatureClass(),
          Spacer(),
          ForecastView(),
        ],
      ),
    );
  }
}

