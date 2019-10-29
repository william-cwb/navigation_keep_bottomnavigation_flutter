import 'package:flutter/material.dart';
import 'package:navigation_keep_bottomnavigation/model/PageModel.dart';
import 'package:navigation_keep_bottomnavigation/pages/page_one.dart';
import 'package:navigation_keep_bottomnavigation/pages/page_three.dart';
import 'package:navigation_keep_bottomnavigation/pages/page_two.dart';
import 'package:navigation_keep_bottomnavigation/provider/AppProvider.dart';
import 'package:provider/provider.dart';

void main() => runApp(InitialPage());

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => AppProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: ContainerPage(),
      ),
    );
  }
}

class ContainerPage extends StatefulWidget {
  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  List<PageModel> _pages = List();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _pages.add(new PageModel('Page One', Icon(Icons.home), PageOne()));
    _pages.add(new PageModel('Page Two', Icon(Icons.dashboard), PageTwo()));
    _pages.add(
        new PageModel('Page Three', Icon(Icons.file_download), PageThree()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _pages.elementAt(0).icon,
            title: Text(_pages.elementAt(0).name),
          ),
          BottomNavigationBarItem(
            icon: _pages.elementAt(1).icon,
            title: Text(_pages.elementAt(1).name),
          ),
          BottomNavigationBarItem(
            icon: _pages.elementAt(2).icon,
            title: Text(_pages.elementAt(2).name),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => _handleClickBottomtab(index, context),
      ),
      body: BodyWidget(),
    );
  }

  void _handleClickBottomtab(int index, context) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    appProvider.pushNav(_pages.elementAt(index).widget, clearList: true);
    setState(() {
      _selectedIndex = index;
    });
  }
}

class BodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return appProvider.pages.last;
  }
}
