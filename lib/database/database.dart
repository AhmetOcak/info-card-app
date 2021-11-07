class Database {

  static Map<String, String> database = {

  };

  static String? getData(String cardName) {
    return database[cardName];
  }

  static void setData(String cardName, String text) {
    database[cardName] = text;
  }
}