import 'package:flutter/material.dart';
import 'package:info_card_app/constants.dart';
import 'package:info_card_app/models/cards_data.dart';
import 'package:provider/provider.dart';

class EditInfoCard extends StatefulWidget {
  EditInfoCard(
      {Key? key, required this.cardName, this.catId, this.id, this.data})
      : super(key: key);
  final String cardName;
  final int? catId;
  final int? id;

  String? data = '';

  @override
  State<EditInfoCard> createState() => _EditInfoCardState();
}

class _EditInfoCardState extends State<EditInfoCard> {
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
                Provider.of<CardsData>(context, listen: false)
                    .uptadeInfoCardData(
                  widget.data!,
                  widget.catId,
                  widget.cardName,
                  widget.id,
                );
                Navigator.of(context).popUntil(
                  ModalRoute.withName('/home'),
                );
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
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                onChanged: (val) {
                  widget.data = val;
                },
                initialValue: widget.data,
                textAlignVertical: TextAlignVertical.top,
                cursorColor: accentColor,
                style: myStyle.copyWith(
                  color: textColor,
                ),
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
