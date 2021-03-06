import 'package:flutter/material.dart';
import 'package:info_card_app/models/cards_data.dart';
import 'package:info_card_app/screens/create_category.dart';
import 'package:info_card_app/screens/create_info_card.dart';
import 'package:info_card_app/screens/info_cards.dart';
import 'package:info_card_app/screens/my_info_card.dart';
import 'package:provider/provider.dart';
import 'screens/edit_my_info_card.dart';
import 'screens/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => CardsData(),
      child: MaterialApp(
        initialRoute: '/home',
        routes: {
          '/home': (context) => const MyApp(),
          '/createCategory': (context) => CreateCategory(),
          '/infoCards': (context) => const InfoCardScreen(
                catId: null,
              ),
          '/createInfoCards': (context) => CreateInfoCard(
                catId: null,
              ),
          '/editInfoCard': (context) => EditInfoCard(
                cardName: '',
              ),
          '/myCard': (context) => const MyCard(
                cardName: '',
                catId: null,
                id: null,
                data: '',
              ),
        },
        debugShowCheckedModeBanner: false,
      ),
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
