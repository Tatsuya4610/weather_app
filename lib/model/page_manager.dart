

import 'package:flutter/cupertino.dart';

class PageManager extends ChangeNotifier {

  int _page = 0; //選択中のページ。

  int get page {
    return _page;
  }

  void setPage(int value) {
    _page = value;
    notifyListeners();
  }
}