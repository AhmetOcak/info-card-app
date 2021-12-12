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
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width / 1.2,
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
        child: Card(
          elevation: 5,
          shadowColor: accentColor,
          color: accentColor,
          margin: EdgeInsets.all(MediaQuery.of(context).size.width / 40),
          child: Column(
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
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: (MediaQuery.of(context).size.width / 100),
                          ),
                          child: Text(
                            time,
                            style: myStyle.copyWith(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: (MediaQuery.of(context).size.width / 100),
                          ),
                          child: Text(
                            date,
                            style: myStyle.copyWith(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
