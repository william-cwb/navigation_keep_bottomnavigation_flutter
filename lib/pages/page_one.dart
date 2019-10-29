import 'package:flutter/material.dart';
import 'package:navigation_keep_bottomnavigation/pages/page_one_detail.dart';
import 'package:navigation_keep_bottomnavigation/provider/AppProvider.dart';
import 'package:provider/provider.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageOne'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Navigate Page 1"),
          onPressed: () => _onClickNavgation(context),
        ),
      ),
    );
  }

  _onClickNavgation(context) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    appProvider.pushNav(PageOneDetail());
  }
}
