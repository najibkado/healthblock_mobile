import 'dart:convert';

Summary summaryFromJson(String str) => Summary.fromJson(json.decode(str));

String summaryToJson(Summary data) => json.encode(data.toJson());

class Summary {
  Summary({
    this.name,
    this.job,
    this.isDoctor,
    this.department,
    this.patientsCount,
  });

  String name;
  String job;
  bool isDoctor;
  Department department;
  int patientsCount;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        name: json["name"],
        job: json["job"],
        isDoctor: json["is_doctor"],
        department: Department.fromJson(json["department"]),
        patientsCount: json["patients_count"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "is_doctor": isDoctor,
        "department": department.toJson(),
        "patients_count": patientsCount,
      };
}

class Department {
  Department({
    this.name,
    this.description,
  });

  String name;
  String description;

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
      };
}
