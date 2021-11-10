import 'package:flutter/material.dart';
import 'package:info_card_app/constants.dart';
import 'package:info_card_app/models/infocard_model.dart';
import 'package:info_card_app/random_id.dart';
import 'package:info_card_app/time.dart';
import 'package:info_card_app/utils/dbhelper.dart';

class CreateInfoCard extends StatefulWidget {
  const CreateInfoCard({Key? key, required this.catId}) : super(key: key);
  final int? catId;

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
              await DatabaseHelper.instance.addInfoCard(InfoCardModel(
                name: _controller.text,
                data: '',
                creatingTime: CUTime.todaysTime(),
                creatingDay: CUTime.todaysDate(),
                catId: widget.catId!,
                id: RandomId.addId(),
              ));
              RandomId.currentInfoCardId = RandomId.addId() - 1;
              print('${RandomId.currentInfoCardId} create');
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
