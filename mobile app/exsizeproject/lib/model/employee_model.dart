import 'package:equatable/equatable.dart';

class EmployeeModel extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? department;
  final int? salary;
  final int? experience;
  final bool? active;
  final DateTime? joiningDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? image;

  const EmployeeModel({
    this.id,
    this.name,
    this.email,
    this.department,
    this.salary,
    this.experience,
    this.active,
    this.joiningDate,
    this.createdAt,
    this.updatedAt,
    this.image
  });


  EmployeeModel copyWith({
    int? id,
    String? name,
    String? email,
    String? department,
    int? salary,
    int? experience,
    bool? active,
    DateTime? joiningDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? image
  }) {
    return EmployeeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      department: department ?? this.department,
      salary: salary ?? this.salary,
      experience: experience ?? this.experience,
      active: active ?? this.active,
      joiningDate: joiningDate ?? this.joiningDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      image: image??this.image
    );
  }


  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      department: json['department'],
      salary: json['salary'],
      experience: json['experience'],
      active: json['active'],
      joiningDate: json['joiningDate'] != null
          ? DateTime.parse(json['joiningDate'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      image: json['image']
    );
  }


  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "department": department,
      "salary": salary,
      "experience": experience,
      "active": active,
      "joiningDate": joiningDate?.toIso8601String(),
      "createdAt": createdAt?.toIso8601String(),
      "updatedAt": updatedAt?.toIso8601String(),
      "image":image
    };
  }


  @override
  List<Object?> get props => [
        id,
        name,
        email,
        department,
        salary,
        experience,
        active,
        joiningDate,
        createdAt,
        updatedAt,
        image
      ];
}