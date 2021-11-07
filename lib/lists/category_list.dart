import 'package:info_card_app/components/category.dart';

class CategoryList {
  static List<CategoryCard> categoryList = [];

  static void addCategoryCard(String categoryName) {
    categoryList.add(CategoryCard(categoryName: categoryName));
  }
  
  static List<CategoryCard> showCategoryCardList() {
    return categoryList;
  }
  
  static void deleteList(CategoryCard categoryCard) {
    categoryList.remove(categoryCard);
  }
}
