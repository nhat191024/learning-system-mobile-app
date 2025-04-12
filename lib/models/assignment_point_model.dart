class AssignmentPointModel {
  String? title;
  String? type;
  String? dueDate;
  int? point;
  int? totalPoint;
  bool? handedIn;

  AssignmentPointModel({
    this.title,
    this.type,
    this.dueDate,
    this.point,
    this.totalPoint,
    this.handedIn,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'type': type,
      'dueDate': dueDate,
      'point': point,
      'totalPoint': totalPoint,
      'handedIn': handedIn,
    };
  }

  AssignmentPointModel.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    type = map['type'];
    dueDate = map['dueDate'];
    point = map['score'];
    totalPoint = map['total_score'];
    handedIn = map['handed_in'];
  }
}