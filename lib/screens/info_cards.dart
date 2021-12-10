import 'package:flutter/material.dart';
import 'package:info_card_app/constants.dart';
import 'package:info_card_app/models/cards_data.dart';
import 'package:info_card_app/screens/create_info_card.dart';
import 'package:provider/provider.dart';

class InfoCardScreen extends StatelessWidget {
  const InfoCardScreen({Key? key, required this.catId}) : super(key: key);
  final int? catId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: textColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Info Cards',
          style: myStyle,
        ),
      ),
      body: Center(
        child: Provider.of<CardsData>(context).getInfoCard(catId),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateInfoCard(
                        catId: catId!,
                      )));
        },
        child: const Icon(
          Icons.add,
          color: textColor,
        ),
        backgroundColor: accentColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
