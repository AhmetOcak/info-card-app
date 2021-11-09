// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:info_card_app/constants.dart';
import 'package:info_card_app/models/infocard_model.dart';
import 'package:info_card_app/screens/edit_my_info_card.dart';
import 'package:info_card_app/utils/dbhelper.dart';

class MyCard extends StatefulWidget {
  const MyCard({Key? key, required this.cardName, required this.catId}) : super(key: key);
  final String cardName;
  final int? catId;

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: textColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) =>
                            EditInfoCard(cardName: widget.cardName, catId: widget.catId),),);
                setState(() {});
              },
              icon: const Icon(
                Icons.mode_edit_outline_outlined,
                size: 35,
                color: textColor,
              ),
            ),
          ),
        ],
        backgroundColor: accentColor,
        title: Text(
          widget.cardName,
          style: myStyle,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 10,
                  color: backgroundColor,
                  child: FutureBuilder<List<InfoCardModel>>(
                    future: DatabaseHelper.instance.getInfoCardList(widget.catId),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<InfoCardModel>> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: Text('Loading...'),
                        );
                      }
                      return snapshot.data!.isEmpty
                          ? Center(
                              child: Text('no data'),
                            )
                          : ListView(
                              children: snapshot.data!.map((infoCard) {
                                return Center(
                                  child: Text(
                                    infoCard.data,
                                    style: TextStyle(
                                      fontFamily: 'Scheherazade',
                                      fontSize: 30,
                                      color: accentColor,
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
