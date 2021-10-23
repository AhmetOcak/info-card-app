import 'package:flutter/material.dart';
import 'package:info_card_app/screens/create_category.dart';
import 'package:info_card_app/screens/create_info_card.dart';
import 'package:info_card_app/screens/info_card_list.dart';
import 'package:info_card_app/screens/my_info_card.dart';
import 'screens/home.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => const MyApp(),
        '/creatCategory': (context) => const CreateCategory(),
        '/infoCards': (context) => const InfoCardScreen(),
        '/createInfoCards': (context) => const CreateInfoCard(),
        '/myInfoCard': (context) => MyInfoCard(),
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
