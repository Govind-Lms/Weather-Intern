import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherWidget extends StatelessWidget {
  final String image;
  final String temp;
  final String time;
  const WeatherWidget(
      {super.key, required this.image, required this.temp, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(image),
            fit: BoxFit.cover,
            width: 70.0,
            height: 70.0,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            time,
            style: GoogleFonts.archivoNarrow().copyWith(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: const Color(0xE8241B4C),
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
          )
        ],
      ),
    );
  }
}
