import 'package:flutter/material.dart';
import 'package:info_card_app/constants/constants.dart';
import 'package:info_card_app/models/cards_data.dart';
import 'package:info_card_app/screens/my_info_card.dart';
import 'package:provider/provider.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.cardName,
    required this.time,
    required this.date,
    required this.catId,
    required this.id,
    required this.data,
  }) : super(key: key);

  final String cardName;
  final String time;
  final String date;
  final String data;
  final int? catId;
  final int? id;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) => MyCard(
                cardName: cardName,
                catId: catId,
                id: id,
                data: data,
              ),
            ),
          );
        },
        splashColor: accentColor,
        child: ICard(id: id, cardName: cardName, time: time, date: date),
      ),
    );
  }
}

class ICard extends StatelessWidget {
  const ICard({
    Key? key,
    required this.id,
    required this.cardName,
    required this.time,
    required this.date,
  }) : super(key: key);

  final int? id;
  final String cardName;
  final String time;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: accentColor,
      color: accentColor,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 25,
        bottom: MediaQuery.of(context).size.height / 25,
        left: MediaQuery.of(context).size.width / 10,
        right: MediaQuery.of(context).size.width / 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Provider.of<CardsData>(context, listen: false)
                      .deleteInfoCard(id!);
                },
                icon: const Icon(
                  Icons.delete_forever,
                  color: textColor,
                  size: 35,
                ),
              ),
            ],
          ),
          Text(
            cardName,
            style: const TextStyle(
              fontFamily: 'Scheherazade',
              fontSize: 35,
              color: textColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  Text(
                    time,
                    style: myStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    date,
                    style: myStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
