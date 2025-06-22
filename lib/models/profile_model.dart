class ProfileModel {
  int? id;
  String? email;
  String? avatar;
  String? name;
  String? gender;
  String? role;
  String? status;
  String? createdAt;
  String? updatedAt;

  ProfileModel({
    required this.id,
    required this.email,
    required this.avatar,
    required this.name,
    required this.gender,
    required this.role,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'avatar': avatar,
      'name': name,
      'gender': gender,
      'role': role,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  ProfileModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    email = map['email'];
    avatar = map['avatar'];
    name = map['name'];
    gender = map['gender'];
    role = map['role'];
    status = map['status'];
    createdAt = map['createdAt'];
    updatedAt = map['updatedAt'];
  }

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    avatar = json['avatar'];
    name = json['name'];
    gender = json['gender'];
    role = json['role'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}