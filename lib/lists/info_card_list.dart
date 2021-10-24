import 'package:info_card_app/info_card/info_card.dart';

class InfoCardList {

  InfoCardList({required List<InfoCard> infoCardList});

  List<InfoCard> infoCardList = [];
  Map<String, List<InfoCard>> myMap = {

  };
  
  void addInfoCards(String infoCardName) {
    myMap[infoCardName] = infoCardList;
  }
  
}