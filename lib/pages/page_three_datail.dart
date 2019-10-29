import 'package:flutter/material.dart';
import 'package:navigation_keep_bottomnavigation/provider/AppProvider.dart';
import 'package:provider/provider.dart';

class PageThreeDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            AppProvider appProvider =
                Provider.of<AppProvider>(context, listen: false);
            appProvider.popNav();
          },
        ),
      ),
      body: Center(
        child: Text('Page Three Detail'),
      ),
    );
  }
}
