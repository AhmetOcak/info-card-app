import 'package:flutter/material.dart';
import 'package:info_card_app/constants/constants.dart';
import 'package:info_card_app/info_card/info_card.dart';

class InfoCardScreen extends StatelessWidget {
  const InfoCardScreen({Key? key}) : super(key: key);

  // final List<InfoCard> infoCardList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(
          'My Info Cards',
          style: myStyle,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            InfoCard(cardName: 'a'),
            InfoCard(cardName: 'b'),
            InfoCard(cardName: 'c'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/creatInfoCards');
        },
        child: Icon(Icons.add, color: textColor,),
        backgroundColor: appBarColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}