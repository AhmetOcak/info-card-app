import 'package:flutter/material.dart';
import 'package:info_card_app/constants.dart';
import 'package:info_card_app/components/info_card.dart';
import 'package:info_card_app/models/infocard_model.dart';
import 'package:info_card_app/screens/create_info_card.dart';
import 'package:info_card_app/utils/dbhelper.dart';

class InfoCardScreen extends StatefulWidget {
  const InfoCardScreen({Key? key}) : super(key: key);

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: textColor,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'My Info Cards',
          style: myStyle,
        ),
      ),
      body: Center(
        child: FutureBuilder<List<InfoCardModel>> (
          future: DatabaseHelper.instance.getInfoCardList(),
          builder: (BuildContext context, AsyncSnapshot<List<InfoCardModel>> snapshot) {
            if(!snapshot.hasData) {
              return const Center(child: Text('Loading'),);
            }
            return snapshot.data!.isEmpty ? const Center(child: Text('no data'),) : 
            ListView(children: snapshot.data!.map((infoCardModel) {
              return Center(
                child: InfoCard(cardName: infoCardModel.name, time: infoCardModel.creatingTime, date: infoCardModel.creatingDay),
              );
            }).toList(),);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateInfoCard())).then((_) {
            setState(() {
            });
          });
        },
        child: const Icon(Icons.add, color: textColor,),
        backgroundColor: accentColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}