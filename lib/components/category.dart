import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info_card_app/constants.dart';
import 'package:info_card_app/screens/info_cards.dart';
import 'package:info_card_app/utils/dbhelper.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({Key? key, required this.categoryName,this.id}) : super(key: key);
  String categoryName;
  int? id;

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
              builder: (context) => InfoCardScreen(),
            ),
          );
          
          // category kartı, kendisine ait olan, info kartlarını tutan listi info kartlarını gösterecek olan sayfaya gönderiyor.
        },
        splashColor: Colors.green[100],
        child: Card(
          elevation: 5,
          color: cardColor,
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () async {
                      await DatabaseHelper.instance.removeCategoryCard(id!);
                    },
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









