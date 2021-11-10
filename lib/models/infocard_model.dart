class InfoCardModel {
  final int catId;
  final String name;
  final String data;
  final String creatingTime;
  final String creatingDay;

  InfoCardModel({required this.catId, required this.name, required this.data, required this.creatingTime, required this.creatingDay});

  factory InfoCardModel.fromMap(Map<String, dynamic> json) => InfoCardModel(
        catId: json['catId'],
        name: json['name'],
        data: json['data'],
        creatingTime: json['creatingTime'],
        creatingDay: json['creatingDay'],
      );

  Map<String, dynamic> toMap() {
    return {
      'catId': catId,
      'name': name,
      'data': data,
      'creatingTime': creatingTime,
      'creatingDay': creatingDay,
    };
  }
}
