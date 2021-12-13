import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info_card_app/components/category.dart';
import 'package:info_card_app/components/info_card.dart';
import 'package:info_card_app/constants/constants.dart';
import 'package:info_card_app/models/category_model.dart';
import 'package:info_card_app/models/infocard_model.dart';
import 'package:info_card_app/time.dart';
import 'package:info_card_app/utils/dbhelper.dart';

class CardsData extends ChangeNotifier {
  // CATEGORY CARDS
  FutureBuilder<List<Category>> getCategoryList() {
    return FutureBuilder<List<Category>>(
      future: DatabaseHelper.instance.getCategoryList(),
      builder: (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: Text('Loading ..'),
          );
        }
        return snapshot.data!.isEmpty
            ? Center(
                child: emptyCardWarning(
                    context, "You don't have any category cards."),
              )
            : ListView(
                children: snapshot.data!.map(
                  (category) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Column(
                        children: [
                          Expanded(
                            child: CategoryCard(
                              categoryName: category.name,
                              id: category.id,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              );
      },
    );
  }

  void addCategoryCard(String cardName) async {
    await DatabaseHelper.instance.addCategoryCard(
      Category(name: cardName),
    );
    notifyListeners();
  }

  void deleteCategoryCard(int? id) async {
    await DatabaseHelper.instance.removeCategoryCard(id!);
    notifyListeners();
  }
  // CATEGORY CARDS

  // ****************************************************************************************
  // ****************************************************************************************
  // ****************************************************************************************
  // ****************************************************************************************

  // INFO CARDS
  FutureBuilder<List<InfoCardModel>> getInfoCard(int? categoryId) {
    return FutureBuilder<List<InfoCardModel>>(
      future: DatabaseHelper.instance.getInfoCardList(categoryId),
      builder:
          (BuildContext context, AsyncSnapshot<List<InfoCardModel>> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: Text('Loading'),
          );
        }
        return snapshot.data!.isEmpty
            ? Center(
                child:
                    emptyCardWarning(context, "You don't have any info cards."),
              )
            : ListView(
                children: snapshot.data!.map(
                  (infoCardModel) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Column(
                        children: [
                          Expanded(
                            child: InfoCard(
                              cardName: infoCardModel.name,
                              time: infoCardModel.creatingTime,
                              date: infoCardModel.creatingDay,
                              catId: categoryId,
                              id: infoCardModel.id,
                              data: infoCardModel.data,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              );
      },
    );
  }

  void addInfoCard(String cardName, int? categoryId) async {
    await DatabaseHelper.instance.addInfoCard(
      InfoCardModel(
        name: cardName,
        data: '',
        creatingTime: Time.todaysTime(),
        creatingDay: Time.todaysDate(),
        catId: categoryId!,
      ),
    );
    notifyListeners();
  }

  void deleteInfoCard(int id) async {
    await DatabaseHelper.instance.removeInfoCard(id);
    notifyListeners();
  }

  FutureBuilder<String> getData(int? id) {
    return FutureBuilder<String>(
      future: DatabaseHelper.instance.getInfoCardData(id),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: Text('Loading'),
          );
        }
        return snapshot.data!.isEmpty
            ? const Center(
                child: Text(
                  'no data',
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  snapshot.data.toString(),
                  style: myStyle,
                ),
              );
      },
    );
  }

  void uptadeInfoCardData(
      String data, int? categoryId, String cardName, int? infoCardId) async {
    await DatabaseHelper.instance.uptadeInfoCard(
      data,
      InfoCardModel(
        catId: categoryId!,
        name: cardName,
        data: data,
        creatingTime: Time.todaysTime(),
        creatingDay: Time.todaysDate(),
        id: infoCardId!,
      ),
    );
    notifyListeners();
  }

  // INFO CARDS
}
