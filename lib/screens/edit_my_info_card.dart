import 'package:flutter/material.dart';
import 'package:info_card_app/constants.dart';
import 'package:info_card_app/models/infocard_model.dart';
import 'package:info_card_app/time.dart';
import 'package:info_card_app/utils/dbhelper.dart';

class EditInfoCard extends StatefulWidget {
  const EditInfoCard({Key? key, required this.cardName, this.catId,}) : super(key: key);
  final String cardName;
  final int? catId;
  
  @override
  _EditInfoCardState createState() => _EditInfoCardState();
}

class _EditInfoCardState extends State<EditInfoCard> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: textColor,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: IconButton(
              onPressed: () async {
                await DatabaseHelper.instance.uptadeInfoCard(widget.catId!, text, InfoCardModel(catId: widget.catId!, name: widget.cardName, data: text, creatingTime: CUTime.todaysTime(), creatingDay: CUTime.todaysDate()));
                setState(() {
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
                onChanged: (val) {
                  setState(() {
                    text = val;
                  });
                },
                //initialValue: ,
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
