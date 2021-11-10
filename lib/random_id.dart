class RandomId {
  static int id = 1;

  static int addId() {
    for(int i = 0; i < id; i ++) {
      id = i;
      print(id);
      return id;
    }
    return 999;
  }
}