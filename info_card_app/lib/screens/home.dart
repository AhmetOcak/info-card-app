import 'package:flutter/material.dart';
import 'package:info_card_app/constants/constants.dart';
import 'package:info_card_app/category-card/category.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            children: [
              CategoryCard(categoryName: 'Science',),
              CategoryCard(categoryName: 'Math',),
              CategoryCard(categoryName: 'Rocket',),
              CategoryCard(categoryName: 'Girl',),
              CategoryCard(categoryName: 'Love',),
            ],
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
