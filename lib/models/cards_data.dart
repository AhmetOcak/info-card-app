import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info_card_app/components/category.dart';
import 'package:info_card_app/components/info_card.dart';
import 'package:info_card_app/constants.dart';
import 'package:info_card_app/models/category_model.dart';
import 'package:info_card_app/models/infocard_model.dart';
import 'package:info_card_app/random_id.dart';
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
                child: emptyCardWarning(context, "You don't have any category cards."),
              )
            : ListView(
                children: snapshot.data!.map((category) {
                  return Center(
                    child: CategoryCard(
                      categoryName: category.name,
                      id: category.id,
                    ),
                  );
                }).toList(),
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




  // INFO CARD
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
                child: emptyCardWarning(context, "You don't have any info cards."),
              )
            : ListView(
                children: snapshot.data!.map((infoCardModel) {
                  return Center(
                    child: InfoCard(
                      cardName: infoCardModel.name,
                      time: infoCardModel.creatingTime,
                      date: infoCardModel.creatingDay,
                      catId: categoryId,
                      id: infoCardModel.id,
                      data: infoCardModel.data,
                    ),
                  );
                }).toList(),
              );
      },
    );
  }

  void addInfoCard(String cardName, int? categoryId) async {
    await DatabaseHelper.instance.addInfoCard(InfoCardModel(
      name: cardName,
      data: '',
      creatingTime: CUTime.todaysTime(),
      creatingDay: CUTime.todaysDate(),
      catId: categoryId!,
      id: GiveID.addId(),
    ));
    notifyListeners();
  }

  void deleteInfoCard(int id) async {
    await DatabaseHelper.instance.removeInfoCard(id);
    notifyListeners();
  }
  // INFO CARDS
}
