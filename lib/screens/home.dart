import 'package:flutter/material.dart';
import 'package:info_card_app/components/category.dart';
import 'package:info_card_app/constants.dart';
import 'package:info_card_app/models/category_model.dart';
import 'package:info_card_app/utils/dbhelper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
      body: Center(
        child: FutureBuilder<List<Category>>(
          future: DatabaseHelper.instance.getCategoryList(),
          builder: (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
            if(!snapshot.hasData) {
              return const Center(child: Text('Loading ..'),);
            }
            return snapshot.data!.isEmpty ? const Center(child: Text('no data'),) : 
            ListView(children: snapshot.data!.map((category) {
              return Center(
                child: CategoryCard(categoryName: category.name,),
              );
            }).toList(),);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/createCategory').then((_) {
            setState(() {
              
            });
          });
        },
        child: const Icon(
          Icons.add,
          color: textColor,
        ),
        backgroundColor: accentColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

