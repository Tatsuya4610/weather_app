import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'package:weather_flutter_app/model/page_manager.dart';
import 'package:weather_flutter_app/model/weather_location.dart';
import 'package:weather_flutter_app/widgets/page_point.dart';
import 'package:weather_flutter_app/widgets/transformer.dart';
import 'package:weather_flutter_app/widgets/weather_container.dart';

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String weatherImg;

    final pageManager = Provider.of<PageManager>(context);
    if (locationList[pageManager.page].weather == 'Clear') {
      weatherImg = 'assets/images/sun.jpg';
    } else if (locationList[pageManager.page].weather == 'Clouds') {
      weatherImg = 'assets/images/cloudy.jpg';
    } else if (locationList[pageManager.page].weather == 'Rain') {
      weatherImg = 'assets/images/rain.jpg';
    } else {
      weatherImg = 'assets/images/night.jpg';
    }

    return Scaffold(
      extendBodyBehindAppBar: true, //*背景と同化。
      appBar: AppBar(
        backgroundColor: Colors.transparent, //*背景と同化する為に設定要。
        elevation: 0,
        title: Text('天気情報'),
        leading: IconButton(
          icon: Icon(
            Icons.search,
            size: 30,
          ),
          onPressed: () {},
        ),
        actions: [IconButton(icon: Icon(Icons.list), onPressed: () {})],
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Image.asset(
              weatherImg,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black38),
            ),
            Container(
              margin: EdgeInsets.only(top: 120, left: 15),
              child: Row(
                children: [
                  for (int i = 0; i < locationList.length; i++) //リスト分だけ表示。
                    if (i == pageManager.page) //表示しているPagePointが同じなら。
                      PagePoint(isActive: true)
                    else
                      PagePoint(isActive: false)
                ],
              ),
            ),
            TransformerPageView(
              //Dartパッケージ
              onPageChanged: (value) => pageManager.setPage(value), //ページ番号渡し。
              transformer:
                  AccordionTransformer(), //transformer.dartに違うパターンのページ移動有ります。
              scrollDirection: Axis.horizontal, //横スクロール。
              itemCount: locationList.length,
              itemBuilder: (ctx, index) => WeatherContainer(index),
            ),
          ],
        ),
      ),
    );
  }
}
