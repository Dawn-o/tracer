import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tracer/firebase_options.dart';
import 'package:tracer/pages/main_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
