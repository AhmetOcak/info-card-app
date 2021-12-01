import 'package:flutter/cupertino.dart';
import 'package:info_card_app/components/category.dart';
import 'package:info_card_app/models/category_model.dart';
import 'package:info_card_app/utils/dbhelper.dart';

class CardsData extends ChangeNotifier {
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
            ? const Center(
                child: Text('no data'),
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
}
