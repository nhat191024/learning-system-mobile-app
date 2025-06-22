class ClassDetailModel {
  int? id;
  String? name;
  String? code;
  String? description;
  String? teacherName;
  String? createAt;

  ClassDetailModel({
    required this.id,
    required this.name,
    required this.description,
    required this.teacherName,
    required this.createAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'description': description,
      'teacherName': teacherName,
      'createAt': createAt,
    };
  }

  ClassDetailModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    code = map['code'];
    description = map['description'];
    teacherName = map['teacherName'];
    createAt = map['createAt'];
  }

  ClassDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    description = json['description'];
    teacherName = json['teacherName'];
    createAt = json['createdAt'];
  }
}
