import 'package:flutter/material.dart';
import 'package:info_card_app/constants/constants.dart';

class CreateInfoCard extends StatefulWidget {
  CreateInfoCard({Key? key}) : super(key: key);

  @override
  _CreateInfoCardState createState() => _CreateInfoCardState();
}

class _CreateInfoCardState extends State<CreateInfoCard> {
  TextEditingController _controller = TextEditingController();

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
              decoration: const InputDecoration(
                hintText: 'Enter info card name',
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
            child: const Text(
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
