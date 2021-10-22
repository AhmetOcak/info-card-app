// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:info_card_app/constants/constants.dart';

class CreateCategory extends StatefulWidget {
  CreateCategory({Key? key}) : super(key: key);

  @override
  _CreateCategoryState createState() => _CreateCategoryState();
}

class _CreateCategoryState extends State<CreateCategory> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Category',
          style: myStyle,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
            child: TextField(
              controller: _controller,
              style: myStyle,
              decoration: InputDecoration(
                hintText: 'Enter category name',
                hintStyle: myStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              //Navigator.pop(context, _controller);
            },
            child: Text(
              'Create',
              style: myStyle,
            ),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(10),
            ),
          ),
        ],
      ),
    );
  }
}
