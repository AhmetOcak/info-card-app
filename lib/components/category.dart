import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info_card_app/constants/constants.dart';
import 'package:info_card_app/models/cards_data.dart';
import 'package:info_card_app/screens/info_cards.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.categoryName, this.id})
      : super(key: key);
  final String categoryName;
  final int? id;

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
              builder: (context) => InfoCardScreen(catId: id),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Provider.of<CardsData>(context, listen: false)
                          .deleteCategoryCard(id);
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
                categoryName,
                style: myStyle.copyWith(
                  fontSize: 55,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
