class Database {

  static Map<String, String> database = {
    'as': 'deneme',
  };

  static String? getData(String cardName) {
    print('get $cardName');
    return database[cardName];
  }

  static void setData(String cardName, String text) {
    database[cardName] = text;
  }
}