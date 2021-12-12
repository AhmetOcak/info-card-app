class Time {
  static String todaysTime() {
    return DateTime.now().toString().substring(11, 19);
  }

  static String todaysDate() {
    return DateTime.now().toString().substring(0, 10);
  }
}
