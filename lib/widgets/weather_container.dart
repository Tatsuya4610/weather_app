import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_flutter_app/model/weather_location.dart';

class WeatherContainer extends StatelessWidget {
  WeatherContainer(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 120),
                    Text(
                      locationList[index].city,
                      style: GoogleFonts.lato(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      DateFormat.yMd().add_Hm().format(DateTime.now()),
                      style:
                          GoogleFonts.lato(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
                Text(
                  'スクロールできます。TransformerPageViewのtransformerに違うtransformer.dart入れ変更。',
                  style: TextStyle(color: Colors.white),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      locationList[index].temperature,
                      style: GoogleFonts.lato(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          locationList[index].icon,
                          color: Colors.white,
                          size: 34,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          locationList[index].weather,
                          style: GoogleFonts.lato(
                              color: Colors.white, fontSize: 25),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 40),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white30)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        '風速',
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${locationList[index].wind.toString()}m/s',
                        style:
                            GoogleFonts.lato(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        '湿度',
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '50％',
                        style:
                            GoogleFonts.lato(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        '降水確率',
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${locationList[index].humidity.toString()}%',
                        style:
                            GoogleFonts.lato(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
