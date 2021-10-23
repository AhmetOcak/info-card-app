// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:info_card_app/constants/constants.dart';

class MyInfoCard extends StatefulWidget {
  MyInfoCard({Key? key}) : super(key: key);

  @override
  _MyInfoCardState createState() => _MyInfoCardState();
}

class _MyInfoCardState extends State<MyInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.more_vert,
                  color: textColor,
                ),
              ),
            ),
        ],
        backgroundColor: accentColor,
        title: const Text(
          'Card Name',
          style: myStyle,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: 'merhaba bu deneme',
                textAlignVertical: TextAlignVertical.top,
                cursorColor: accentColor,
                style: TextStyle(color: accentColor, fontSize: 30),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: accentColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: accentColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                maxLines: null,
                expands: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
