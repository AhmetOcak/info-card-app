import 'package:flutter/material.dart';
import 'package:info_card_app/screens/create_category.dart';
import 'package:info_card_app/screens/create_info_card.dart';
import 'package:info_card_app/screens/info_card_screen.dart';
import 'screens/home.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => MyApp(),
        '/creatCategory': (context) => CreateCategory(),
        '/infoCards': (context) => InfoCardScreen(),
        '/creatInfoCards': (context) => CreateInfoCard(),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
