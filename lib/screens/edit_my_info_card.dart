import 'package:flutter/material.dart';
import 'package:info_card_app/constants/constants.dart';
import 'package:info_card_app/database/database.dart';
import 'package:info_card_app/main.dart';
import 'package:info_card_app/screens/my_info_card.dart';

class EditInfoCard extends StatefulWidget {
  EditInfoCard({Key? key, required this.cardName}) : super(key: key);
  String cardName;
  @override
  _EditInfoCardState createState() => _EditInfoCardState();
}

class _EditInfoCardState extends State<EditInfoCard> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: Database.getData(widget.cardName));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

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
                setState(() {
                  Database.setData(widget.cardName, _controller.text);
                  Navigator.pop(context);
                });
              },
              icon: const Icon(
                Icons.check,
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
              child: TextFormField(
                controller: _controller,
                textAlignVertical: TextAlignVertical.top,
                cursorColor: accentColor,
                style: const TextStyle(color: accentColor, fontSize: 30),
                decoration: const InputDecoration(
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
