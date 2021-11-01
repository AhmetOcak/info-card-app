class Database {

  static Map<String, String> database = {

  };

  static String? getData(String cardName) {
    return database[cardName];
  }

  static void setData(String cardName, String text) {
    database[cardName] = text;
    /*
    String? temp1 = '';
    String temp2 = '';

    if(database[cardName] != null) {
      temp1 = database[cardName];
      temp2 = temp1!;
      temp2 += text;
      database[cardName] = temp2;
    }
    */
  }
}