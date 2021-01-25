import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherLocation {
  final String city;
  final String dateTime;
  final String temperature;
  final String weather;
  final IconData icon;
  final int wind;
  final int rain;
  final int humidity;

  WeatherLocation({
    this.city,
    this.dateTime,
    this.temperature,
    this.icon,
    this.weather,
    this.wind,
    this.rain,
    this.humidity,
  });
}

final locationList = [
  WeatherLocation(
    city: 'ロンドン',
    dateTime: DateFormat.yMd().add_Hm().format(DateTime.now()),
    temperature: '24\u2103',
    weather:  'Sunny',
    icon: WeatherIcons.sunset,
    wind: 1,
    rain: 40,
    humidity: 20,
  ),
  WeatherLocation(
    city: 'ニューヨーク',
    dateTime: DateFormat.yMd().add_Hm().format(DateTime.now()),
    temperature: '25\u2103',
    weather:  'Cloudy',
    icon: WeatherIcons.cloud,
    wind: 2,
    rain: 50,
    humidity: 10,
  ),
  WeatherLocation(
    city: 'ハワイ',
    dateTime: DateFormat.yMd().add_Hm().format(DateTime.now()),
    temperature: '26\u2103',
    weather:  'Rain',
    icon: WeatherIcons.rain,
    wind: 3,
    rain: 60,
    humidity: 90,
  ),
  WeatherLocation(
    city: 'シンガポール',
    dateTime: DateFormat.yMd().add_Hm().format(DateTime.now()),
    temperature: '26\u2103',
    weather:  'Night',
    icon: WeatherIcons.moon_alt_new,
    wind: 4,
    rain: 70,
    humidity: 10,
  ),
];
