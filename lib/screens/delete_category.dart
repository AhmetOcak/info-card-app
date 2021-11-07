import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info_card_app/category-card/category.dart';
import 'package:info_card_app/constants/constants.dart';
import 'package:info_card_app/lists/category_list.dart';

class DeleteCategoryCard extends StatelessWidget {
  const DeleteCategoryCard({Key? key, required this.categoryCard}) : super(key: key);
  final CategoryCard categoryCard;

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
        backgroundColor: accentColor,
        title: const Text(
          'Delete Category',
          style: myStyle,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 40, right: 40, bottom: 20),
            child: Padding(
              padding: EdgeInsets.all(50.0),
              child: Text(
                'Are you sure ?',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  color: accentColor,
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              Navigator.pop(context);
              CategoryList.deleteList(categoryCard);
            },
            child: const Text(
              'Delete',
              style: myStyle,
            ),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(10),
              backgroundColor: MaterialStateProperty.all(accentColor),
            ),
          ),
        ],
      ),
    );
  }
}
