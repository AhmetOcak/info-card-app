import 'package:flutter/material.dart';
import 'package:info_card_app/screens/create_category.dart';
import 'screens/home.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => MyApp(),
        '/category': (context) => CreateCategory(),
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
