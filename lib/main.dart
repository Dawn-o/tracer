import 'package:flutter/material.dart';
import 'package:tracer/main_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffF8F8F8),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
          showUnselectedLabels: true,
          elevation: 0,
          unselectedItemColor: Color(0xff767676),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          
        ),
        fontFamily: 'Poppins',
      ),
      home: const MainLayout(),
    );
  }
}
