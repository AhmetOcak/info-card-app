import 'package:flutter/material.dart';
import 'package:info_card_app/constants.dart';
import 'package:info_card_app/models/category_model.dart';
import 'package:info_card_app/utils/dbhelper.dart';

class CreateCategory extends StatefulWidget {
  const CreateCategory({Key? key}) : super(key: key);

  @override
  _CreateCategoryState createState() => _CreateCategoryState();
}

class _CreateCategoryState extends State<CreateCategory> {
  final TextEditingController _controller = TextEditingController();

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
        backgroundColor: backgroundColor,
        elevation: 0,
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
              cursorColor: accentColor,
              decoration: const InputDecoration(
                filled: true,
                hintText: 'Enter category name',
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
              FocusScope.of(context).unfocus();
              await DatabaseHelper.instance.addCategoryCard(Category(name: _controller.text));
              Navigator.pop(context);
              setState(() {
                _controller.clear();
              });
            },
            child: const Text(
              'Create',
              style: myStyle,
            ),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(10),
              backgroundColor: MaterialStateProperty.all(buttonColor),
            ),
          ),
        ],
      ),
    );
  }
}