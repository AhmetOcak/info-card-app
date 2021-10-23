import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info_card_app/constants/constants.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.categoryName}) : super(key: key);

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width / 1.2,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/infoCards');
        },
        splashColor: Colors.green[100],
        child: Card(
          elevation: 5,
          color: cardColor,
          margin: const EdgeInsets.all(15),
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
