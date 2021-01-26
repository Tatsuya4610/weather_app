import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_flutter_app/model/page_manager.dart';
import 'package:weather_flutter_app/model/weather_api.dart';
import 'package:weather_flutter_app/screen/loading_screen.dart';
import 'package:weather_flutter_app/screen/weather_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WeatherAPI(),
          lazy: false, //遅延なし。立ち上げ時にすぐ情報取得。
        ),
        ChangeNotifierProvider(
          create: (_) => PageManager(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Consumer<WeatherAPI>(builder: (_,weatherApi,__) {
          return weatherApi.isLoading ? LoadingScreen() : WeatherScreen();
        },)
      ),
    );
  }
}
