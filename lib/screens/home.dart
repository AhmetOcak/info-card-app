// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:info_card_app/category-card/category.dart';
import 'package:info_card_app/constants/constants.dart';
import 'package:info_card_app/lists/category_list.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: accentColor,
        title: const Text(
          'InfoCard',
          style: myStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column (
            children: CategoryList.showCategoryCardList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/createCategory');
          setState(() {
            
          });
        },
        child: Icon(Icons.add, color: textColor,),
        backgroundColor: accentColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
