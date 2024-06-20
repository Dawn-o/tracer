import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tracer/summary_page.dart';
import 'package:tracer/today_detail_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tracer/history_page.dart';
import 'package:tracer/home_page.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;
  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
  };

  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SummaryPage(),
    HistoryPage(),
  ];

  void _onTimeTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<bool> _onWillPop() async {
    if (_selectedIndex != 0) {
      setState(() {
        _selectedIndex = 0;
      });
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xfFAAD7D9),
        title: const Text(
          "TRACER",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Libre Baskerville',
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24.0),
            child: Icon(Icons.add, size: 35),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _widgetOptions[_selectedIndex],
      
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.house,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.listCheck,
              ),
              label: "Summary",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.clockRotateLeft,
              ),
              label: "History",
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xff92C7CF),
          onTap: _onTimeTapped,
        ),
      ),
    );
  }
}
