import 'package:flutter/material.dart';
import 'package:info_card_app/constants.dart';
import 'package:info_card_app/models/cards_data.dart';
import 'package:info_card_app/screens/edit_my_info_card.dart';
import 'package:provider/provider.dart';

class MyCard extends StatefulWidget {
  const MyCard(
      {Key? key,
      required this.cardName,
      required this.catId,
      required this.id,
      required this.data})
      : super(key: key);
  final String cardName;
  final int? catId;
  final int? id;
  final String data;

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
                    builder: (builder) => EditInfoCard(
                      cardName: widget.cardName,
                      catId: widget.catId,
                      id: widget.id,
                      data: widget.data,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.mode_edit_outline_outlined,
                size: 35,
                color: textColor,
              ),
            ),
          ),
        ],
        backgroundColor: backgroundColor,
        elevation: 0,
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
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: cardColor,
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                    top: BorderSide(
                      color: cardColor,
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                    left: BorderSide(
                      color: cardColor,
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                    right: BorderSide(
                      color: cardColor,
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                margin: const EdgeInsets.all(10.0),
                child: Provider.of<CardsData>(context).getData(widget.id),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
