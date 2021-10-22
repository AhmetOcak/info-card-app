// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:info_card_app/constants/constants.dart';
import 'package:info_card_app/category-card/category.dart';
import 'package:info_card_app/info_card/info_card.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryCard> categoryList = [
    CategoryCard(
      categoryName: 'Science',
    ),
    CategoryCard(
      categoryName: 'Math',
      cardColor: Colors.yellow,
    ),
    CategoryCard(
      categoryName: 'Rocket',
    ),
    CategoryCard(
      categoryName: 'Girl',
    ),
    CategoryCard(
      categoryName: 'Love',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'InfoCard',
          style: myStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: categoryList,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/category');
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
