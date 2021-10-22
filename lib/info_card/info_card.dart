import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard(
      {Key? key, required this.cardName, this.cardColor = Colors.white70})
      : super(key: key);

  final String cardName;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width / 1.2,
      child: InkWell(
        onTap: () {},
        splashColor: Colors.green[100],
        child: Card(
          elevation: 5,
          color: cardColor,
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text(cardName,
                  style: const TextStyle(
                    fontFamily: 'Scheherazade',
                    fontSize: 35,
                  )),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(todaysTime(),
                              style: const TextStyle(
                                fontFamily: 'Scheherazade',
                                fontSize: 20,
                              ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(todaysDate(),
                              style: const TextStyle(
                                fontFamily: 'Scheherazade',
                                fontSize: 20,
                              ),),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String todaysTime() {
    return DateTime.now().toString().substring(11, 19);
  }

  String todaysDate() {
    return DateTime.now().toString().substring(0, 10);
  }
}
