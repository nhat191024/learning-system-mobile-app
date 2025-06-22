class ClassNotificationModel {
  int? id;
  String? content;
  String? createdAt;

  ClassNotificationModel({
    required this.id,
    required this.content,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'createdAt': createdAt,
    };
  }

  ClassNotificationModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    content = map['content'];
    createdAt = map['created_at'];
  }

  ClassNotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    createdAt = json['created_at'];
  }
}