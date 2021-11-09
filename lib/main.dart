import 'package:flutter/material.dart';
import 'package:info_card_app/screens/create_category.dart';
import 'package:info_card_app/screens/create_info_card.dart';
import 'package:info_card_app/screens/info_cards.dart';
import 'package:info_card_app/screens/my_info_card.dart';
import 'screens/edit_my_info_card.dart';
import 'screens/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => const MyApp(),
        '/createCategory': (context) => const CreateCategory(),
        '/infoCards': (context) => const  InfoCardScreen(catId: null,),
        '/createInfoCards': (context) => CreateInfoCard(catId: null,),
        '/editInfoCard': (context) => EditInfoCard(cardName: '',),
        '/myCard': (context) => MyCard(cardName: '',),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
