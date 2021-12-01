import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info_card_app/constants.dart';
import 'package:info_card_app/screens/info_cards.dart';
import 'package:info_card_app/utils/dbhelper.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.categoryName, this.id}) : super(key: key);
  final String categoryName;
  final int? id;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4.5,
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
        splashColor: cardColor,
        child: Card(
          elevation: 5,
          shadowColor: cardColor,
          color: cardColor,
          margin: EdgeInsets.all(MediaQuery.of(context).size.width / 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () async {
                      await DatabaseHelper.instance.removeCategoryCard(id!);
                    },
                    icon: const Icon(
                      Icons.delete_forever,
                      color: Colors.red,
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









