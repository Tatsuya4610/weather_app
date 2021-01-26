import 'package:intl/intl.dart';
import 'package:weather_flutter_app/model/weather_location.dart';

class CityWeather {

  CityWeather.fromJsonDecode(dynamic decodeData) {
    city = decodeData['name'];
    dateTime = DateFormat.yMd().add_Hm().format(DateTime.now());
    temperature = (decodeData['main']['temp'] - 273.15); //ケルビンで情報が来るため。
    weather = decodeData['weather'][0]['main'];
    wind = decodeData['wind']['speed'];
    humidity = decodeData['main']['humidity'];
    pressure = decodeData['main']['pressure'];

    locationList.add(WeatherLocation(
      city: city,
      dateTime: dateTime,
      temperature: temperature,
      weather: weather,
      wind: wind,
      humidity: humidity,
      pressure: pressure,
    ));

  }

  String city;
  String dateTime;
  double temperature;
  String weather;
  double wind;
  int humidity;
  int pressure;
}
