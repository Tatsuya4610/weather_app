import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:weather_flutter_app/model/weather_api.dart';
import 'package:weather_flutter_app/screen/loading_screen.dart';
import 'package:weather_flutter_app/screen/weather_screen.dart';

final weatherApiProvider = ChangeNotifierProvider((ref) => WeatherAPI());
void main() {
  runApp(
    ProviderScope(
      child: Consumer(
        builder: (context, watch, child) {
          watch(weatherApiProvider); // MyApp前に天気情報取得。Providerのlazy:falseと同じ。
          return MyApp();
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Consumer(
        builder: (context, watch,child) {
          final weatherApiData = watch(weatherApiProvider);
          return weatherApiData.isLoading ? LoadingScreen() : WeatherScreen();
        },
      ),
    );
  }
}
