class CourseAssignmentModel {
  int? id;
  String? videoUrl;
  String? title;
  String? description;
  String? duration;
  bool? isSubmitted;

  CourseAssignmentModel({
    required this.id,
    required this.videoUrl,
    required this.title,
    required this.description,
    required this.duration,
    required this.isSubmitted,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'videoUrl': videoUrl,
      'title': title,
      'description': description,
      'duration': duration,
      'isSubmitted': isSubmitted,
    };
  }

  CourseAssignmentModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    videoUrl = map['videoUrl'];
    title = map['title'];
    description = map['description'];
    duration = map['duration'];
    isSubmitted = map['isSubmitted'];
  }
}
