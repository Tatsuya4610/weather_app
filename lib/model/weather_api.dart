import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_flutter_app/model/city_weather.dart';

class WeatherAPI extends ChangeNotifier {
  static String apiKey = 'cdb7cba1aa7713ba61fe1679e2e2cf55';

  WeatherAPI() {
    _loadWeather();
  }

  bool _isLoading = false;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isLoading {
    return _isLoading;
  }

  Future<void> _loadWeather() async {
    isLoading = true;
    try {
      http.Response japanResponse = await http.get(
          'https://api.openweathermap.org/data/2.5/weather?q=Tokyo&appid=$apiKey');
      http.Response londonResponse = await http.get(
          'https://api.openweathermap.org/data/2.5/weather?q=London&appid=$apiKey');
      http.Response hawaiiResponse = await http.get(
          'https://api.openweathermap.org/data/2.5/weather?q=Sydney&appid=$apiKey');
      http.Response washingtonResponse = await http.get(
          'https://api.openweathermap.org/data/2.5/weather?q=Washington&appid=$apiKey');

      if (japanResponse.statusCode == 200 &&
          londonResponse.statusCode == 200 &&
          hawaiiResponse.statusCode == 200 &&
          washingtonResponse.statusCode == 200) {
        //200は問題なく情報取得。
        var japanDecodeData = jsonDecode(japanResponse.body);
        var londonDecodeData = jsonDecode(londonResponse.body);
        var hawaiiDecodeData = jsonDecode(hawaiiResponse.body);
        var washingtonDecodeData = jsonDecode(washingtonResponse.body);

        CityWeather.fromJsonDecode(japanDecodeData);
        CityWeather.fromJsonDecode(londonDecodeData);
        CityWeather.fromJsonDecode(hawaiiDecodeData);
        CityWeather.fromJsonDecode(washingtonDecodeData);
      } else {
        print('情報取得エラー');
      }
      isLoading = false;
    } catch(e) {
      print(e);
    }
  }
}
