import 'package:flutter/material.dart';
import 'package:info_card_app/constants.dart';
import 'package:info_card_app/models/infocard_model.dart';
import 'package:info_card_app/time.dart';
import 'package:info_card_app/utils/dbhelper.dart';

class EditInfoCard extends StatefulWidget {
  EditInfoCard(
      {Key? key, required this.cardName, this.catId, this.id, this.data})
      : super(key: key);
  final String cardName;
  final int? catId;
  final int? id;
  String? data;
  @override
  _EditInfoCardState createState() => _EditInfoCardState();
}

class _EditInfoCardState extends State<EditInfoCard> {
  @override
  void initState() {
    super.initState();
  }

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
              onPressed: () async {
                await DatabaseHelper.instance.uptadeInfoCard(
                    widget.data!,
                    InfoCardModel(
                      catId: widget.catId!,
                      name: widget.cardName,
                      data: widget.data!,
                      creatingTime: CUTime.todaysTime(),
                      creatingDay: CUTime.todaysDate(),
                      id: widget.id!,
                    ));
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
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text(
          "editing ${widget.cardName}",
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
                    widget.data = val;
                  });
                },
                initialValue: widget.data,
                textAlignVertical: TextAlignVertical.top,
                cursorColor: backgroundColor,
                style: myStyle.copyWith(
                  color: cardColor,
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
