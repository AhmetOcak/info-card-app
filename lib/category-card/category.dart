import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info_card_app/constants/constants.dart';
import 'package:info_card_app/info_card/info_card.dart';
import 'package:info_card_app/lists/info_card_list.dart';
import 'package:info_card_app/screens/info_cards.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({Key? key, required this.categoryName}) : super(key: key);
  final String categoryName;
  final List<InfoCard> _infoCardList = [
    InfoCard(cardName: 'testtir'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width / 1.2,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => InfoCardScreen(infoCardList: _infoCardList)));
        },
        splashColor: Colors.green[100],
        child: Card(
          elevation: 5,
          color: cardColor,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.close,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              Text(
                categoryName,
                style: const TextStyle(
                  fontFamily: 'Scheherazade',
                  fontSize: 55,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
