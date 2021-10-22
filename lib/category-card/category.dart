import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.categoryName}) : super(key: key);

  final String categoryName;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width / 1.2,
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, '/infoCards');
        },
        splashColor: Colors.green[100],
        child: Card(
          elevation: 5,
          color: Colors.white70,
          margin: const EdgeInsets.all(15),
          child: Center(
            child: Text(
              categoryName,
              style: const TextStyle(
                fontFamily: 'Scheherazade',
                fontSize: 55,
              )
            ),
          ),
        ),
      ),
    );
  }
}