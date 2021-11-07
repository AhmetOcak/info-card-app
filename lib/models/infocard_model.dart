class InfoCard {
  final int? catId;
  final int? id;
  final String name;
  final String data;
  final String creatingTime;

  InfoCard({this.catId, this.id, required this.name, required this.data, required this.creatingTime});

  factory InfoCard.fromMap(Map<String, dynamic> json) => InfoCard(
        catId: json['catId'],
        id: json['id'],
        name: json['name'],
        data: json['data'],
        creatingTime: json['creatingTime'],
      );

  Map<String, dynamic> toMap() {
    return {
      'catId': catId,
      'id': id,
      'name': name,
      'data': data,
      'creatingTime': creatingTime,
    };
  }
}
