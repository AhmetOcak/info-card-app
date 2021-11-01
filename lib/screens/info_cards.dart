import 'package:flutter/material.dart';
import 'package:info_card_app/constants/constants.dart';
import 'package:info_card_app/info_card/info_card.dart';
import 'package:info_card_app/screens/create_info_card.dart';

class InfoCardScreen extends StatefulWidget {
  InfoCardScreen({Key? key, required this.infoCardList}) : super(key: key);
  List<InfoCard> infoCardList = [];

  @override
  State<InfoCardScreen> createState() => _InfoCardScreenState();
}

class _InfoCardScreenState extends State<InfoCardScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: accentColor,
        title: const Text(
          'My Info Cards',
          style: myStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: widget.infoCardList,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateInfoCard(infoCardList: widget.infoCardList,))).then((_) {
            setState(() {
            });
          });
          // InfoCardScreen sınıfı constructor ı aracılığıyla aldığı listi info kartı oluşturacak olan CreateInfoCard sayfasına gönderiyor
        },
        child: const Icon(Icons.add, color: textColor,),
        backgroundColor: accentColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}