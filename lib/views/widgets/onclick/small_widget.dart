
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomSheetSmallWidget extends StatelessWidget {
  final String imageUrl;
  final String cateName;
  final String value;
  const BottomSheetSmallWidget(
      {super.key,
      required this.imageUrl,
      required this.cateName,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      width: MediaQuery.of(context).size.width / 2 - 40,
      child: Column(
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
          const SizedBox(height: 10.0,),
          Text(
            cateName,
            style: GoogleFonts.oswald().copyWith(
              fontWeight: FontWeight.w600,
              color: const Color(0xE8241B4C).withOpacity(.4),
              fontSize: 16.0,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.oswald().copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xE8241B4C),
              fontSize: 18.0,
            ),
          )
        ],
      ),
    );
  }
}
