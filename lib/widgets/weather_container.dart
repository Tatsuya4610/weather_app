import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_flutter_app/model/weather_location.dart';
import 'package:weather_flutter_app/widgets/weather_tile.dart';
import 'package:weather_icons/weather_icons.dart';

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
                    if(locationList[index].city == 'Tokyo')//日本語で情報を取り入れると東京都になる為、英語で取得し変換。
                      Text(
                        '東京',
                        style: GoogleFonts.lato(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    if (locationList[index].city == 'London')
                      Text(
                        'ロンドン',
                        style: GoogleFonts.lato(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    if (locationList[index].city == 'Sydney')
                      Text(
                        'シドニー',
                        style: GoogleFonts.lato(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    if (locationList[index].city == 'Washington')//日本語で情報を取り入れるとワシントン州になる
                      Text(
                        'ワシントン',
                        style: GoogleFonts.lato(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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
                      '${locationList[index].temperature.toStringAsFixed(0)}\u2103', //u2103は度Cに変換される。
                      style: GoogleFonts.lato(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        if(locationList[index].weather == 'Clear')
                          WeatherTile(iconData: WeatherIcons.sunset,text: '晴れ',),
                        if (locationList[index].weather == 'Clouds')
                          WeatherTile(iconData: WeatherIcons.cloud,text: '曇り',),
                        if(locationList[index].weather == 'Rain')
                          WeatherTile(iconData: WeatherIcons.rain,text: '雨',),
                        if(locationList[index].weather == 'Snow')
                          WeatherTile(iconData: WeatherIcons.snow,text: '雪',),
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
                        '${locationList[index].humidity.toString()}％',
                        style:
                        GoogleFonts.lato(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        '気圧',
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${locationList[index].pressure.toString()}hpa',
                        // '${locationList[index].humidity}%',
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
