import 'package:flutter/material.dart';
import 'package:info_card_app/constants.dart';
import 'package:info_card_app/models/cards_data.dart';
import 'package:provider/provider.dart';

class EditInfoCard extends StatelessWidget {
  EditInfoCard({Key? key, required this.cardName, this.catId, this.id})
      : super(key: key);
  final String cardName;
  final int? catId;
  final int? id;

  String data = "";

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: IconButton(
              onPressed: ()  {
                Provider.of<CardsData>(context, listen: false).uptadeInfoCardData(data, catId, cardName, id);
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.check,
                size: 35,
                color: textColor,
              ),
            ),
          ),
        ],
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text(
          "editing $cardName",
          style: myStyle,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                onChanged: (val) {
                    data = val;
                },
                initialValue: "",
                textAlignVertical: TextAlignVertical.top,
                cursorColor: cardColor,
                style: myStyle.copyWith(
                  color: textColor,
                ),
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: cardColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: cardColor,
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


