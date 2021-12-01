import 'package:flutter/material.dart';
import 'package:info_card_app/constants.dart';
import 'package:info_card_app/models/cards_data.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text(
          'Category Cards',
          style: myStyle,
        ),
      ),
      body: Center(
        child: Provider.of<CardsData>(context).getCategoryList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/createCategory');
        },
        child: const Icon(
          Icons.add,
          color: textColor,
        ),
        backgroundColor: buttonColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

