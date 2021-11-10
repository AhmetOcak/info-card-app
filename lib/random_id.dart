class RandomId {
  static int id = 0;
  static int? currentInfoCardId;
  static int addId() {
    id = id + 1;
    print('adddd $id');
    return id;
  }
}