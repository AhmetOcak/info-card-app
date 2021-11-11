import 'package:flutter/material.dart';
import 'package:info_card_app/constants.dart';
import 'package:info_card_app/screens/my_info_card.dart';

class InfoCard extends StatelessWidget {
  const InfoCard(
      {Key? key,
      required this.cardName,
      required this.time,
      required this.date,
      required this.catId,
      required this.id,
      required this.data})
      : super(key: key);

  final String cardName;
  final String time;
  final String date;
  final String data;
  final int? catId;
  final int? id;
  // kartlara tıklandığında id ortak kalıyor

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width / 1.2,
      child: InkWell(
        onTap: () {
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
        splashColor: Colors.green[100],
        child: Card(
          elevation: 5,
          color: cardColor,
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      cardName,
                      style: const TextStyle(
                        fontFamily: 'Scheherazade',
                        fontSize: 35,
                        color: textColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.close,
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            time,
                            style: const TextStyle(
                              fontFamily: 'Scheherazade',
                              fontSize: 20,
                              color: textColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            date,
                            style: const TextStyle(
                              fontFamily: 'Scheherazade',
                              fontSize: 20,
                              color: textColor,
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
