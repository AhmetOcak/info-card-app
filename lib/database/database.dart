class Database {

  static Map<String, String> database = {

  };

  static getData(String cardName) {
    return database[cardName];
  }

  static void setData(String text, String cardName) {
    database[cardName] = text;
  }
}