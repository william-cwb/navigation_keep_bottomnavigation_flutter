import 'package:flutter/material.dart';
import 'package:navigation_keep_bottomnavigation/pages/page_one.dart';

class AppProvider extends ChangeNotifier {
  List<Widget> pages = List();
  Widget page;
  static AppProvider appProvider;

  AppProvider() {
    pages.add(PageOne());
  }

  pushNav(Widget widget, {bool clearList = false}) {
    if (clearList) {
      this.pages.clear();
    }
    this.pages.add(widget);
    notifyListeners();
  }

  popNav() {
    this.pages.removeLast();
    notifyListeners();
  }
}
