import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherTile extends StatelessWidget {
  WeatherTile({this.iconData, this.text});

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          iconData,
          color: Colors.white,
          size: 34,
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          text,
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}
