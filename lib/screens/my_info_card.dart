import 'package:flutter/material.dart';
import 'package:info_card_app/constants/constants.dart';
import 'package:info_card_app/database/database.dart';

class MyCard extends StatefulWidget {
  MyCard({Key? key, this.cardName = ''}) : super(key: key);
  String cardName;

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  String _myText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/editInfoCard').then((_) {
                  setState(() {
                    print('my info ${widget.cardName}');
                    _myText = Database.getData(widget.cardName)!;
                  });
                });
              },
              icon: const Icon(
                Icons.mode_edit_outline_outlined,
                size: 35,
                color: textColor,
              ),
            ),
          ),
        ],
        backgroundColor: accentColor,
        title: Text(
          widget.cardName,
          style: myStyle,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 10,
                  color: backgroundColor,
                  child: SingleChildScrollView(
                    child: Text(
                      _myText,
                      style: const TextStyle(
                        fontFamily: 'Scheherazade',
                        fontSize: 25,
                        color: accentColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
