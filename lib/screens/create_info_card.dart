import 'package:flutter/material.dart';
import 'package:info_card_app/constants.dart';
import 'package:info_card_app/components/info_card.dart';
import 'package:info_card_app/models/infocard_model.dart';
import 'package:info_card_app/utils/dbhelper.dart';

class CreateInfoCard extends StatefulWidget {
  CreateInfoCard({Key? key, required this.infoCardList,}) : super(key: key);
  List<InfoCard> infoCardList = [];

  @override
  _CreateInfoCardState createState() => _CreateInfoCardState();
}

class _CreateInfoCardState extends State<CreateInfoCard> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: accentColor,
        title: const Text(
          'Create Info Card',
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
              cursorColor: accentColor,
              style: myStyle,
              decoration: const InputDecoration(
                filled: true,
                hintText: 'Enter info card name',
                hintStyle: myStyle,
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
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await DatabaseHelper.instance.addInfoCard(InfoCardModel(name: _controller.text, data: '', creatingTime: todaysTime(), creatingDay: todaysDate(),));
              Navigator.pop(context);
            },
            child: const Text(
              'Create',
              style: myStyle,
            ),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(10),
              backgroundColor: MaterialStateProperty.all(accentColor),
            ),
          ),
        ],
      ),
    );
  }
}

  String todaysTime() {
    return DateTime.now().toString().substring(11, 19);
  }

  String todaysDate() {
    return DateTime.now().toString().substring(0, 10);
  }
