class CourseAssignmentPointModel {
  String? videoUrl;
  String? title;
  String? description;
  int? point;
  int? totalPoint;
  bool? handedIn;

  CourseAssignmentPointModel({
    this.videoUrl,
    this.title,
    this.description,
    this.point,
    this.totalPoint,
    this.handedIn,
  });

  Map<String, dynamic> toMap() {
    return {
      'videoUrl': videoUrl,
      'title': title,
      'description': description,
      'point': point,
      'totalPoint': totalPoint,
      'handedIn': handedIn,
    };
  }

  CourseAssignmentPointModel.fromMap(Map<String, dynamic> map) {
    videoUrl = map['video_url'];
    title = map['title'];
    description = map['description'];
    point = map['score'];
    totalPoint = map['total_score'];
    handedIn = map['isSubmitted'];
  }
}
