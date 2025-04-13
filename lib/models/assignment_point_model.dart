class AssignmentPointModel {
  String? title;
  String? type;
  String? dueDate;
  int? point;
  int? totalPoint;
  String? handedDate;
  bool? handedIn;

  AssignmentPointModel({
    this.title,
    this.type,
    this.dueDate,
    this.point,
    this.totalPoint,
    this.handedDate,
    this.handedIn,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'type': type,
      'dueDate': dueDate,
      'point': point,
      'totalPoint': totalPoint,
      'handedDate': handedDate,
      'handedIn': handedIn,
    };
  }

  AssignmentPointModel.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    type = map['type'];
    dueDate = map['dueDate'];
    point = map['score'];
    totalPoint = map['total_score'];
    handedDate = map['handed_date'];
    handedIn = map['handed_in'];
  }
}