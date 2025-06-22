class CourseModel {
  int? id;
  String? name;
  String? description;
  String? code;
  List<String>? categories;
  bool? joined;
  String? createAt;

  CourseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.code,
    required this.joined,
    required this.createAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'code': code,
      'categories': categories,
      'joined': joined,
      'createAt': createAt,
    };
  }

  CourseModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    description = map['description'];
    code = map['code'];
    categories = map['categories'];
    joined = map['joined'];
    createAt = map['createAt'];
  }

  CourseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    code = json['code'];
    categories = json['categories'].cast<String>();
    joined = json['joined'];
    createAt = json['createAt'];
  }
}
