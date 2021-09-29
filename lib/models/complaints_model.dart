// To parse this JSON data, do
//
//     final complaints = complaintsFromJson(jsonString);

import 'dart:convert';

Complaints complaintsFromJson(String str) =>
    Complaints.fromJson(json.decode(str));

String complaintsToJson(Complaints data) => json.encode(data.toJson());

class Complaints {
  Complaints({
    this.complaints,
  });

  List<Complaint> complaints;

  factory Complaints.fromJson(Map<String, dynamic> json) => Complaints(
        complaints: List<Complaint>.from(
            json["complaints"].map((x) => Complaint.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "complaints": List<dynamic>.from(complaints.map((x) => x.toJson())),
      };
}

class Complaint {
  Complaint({
    this.patient,
    this.doctor,
    this.hdataType,
    this.title,
    this.description,
    this.date,
  });

  int patient;
  int doctor;
  String hdataType;
  String title;
  String description;
  DateTime date;

  factory Complaint.fromJson(Map<String, dynamic> json) => Complaint(
        patient: json["patient"],
        doctor: json["doctor"],
        hdataType: json["hdata_type"],
        title: json["title"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "patient": patient,
        "doctor": doctor,
        "hdata_type": hdataType,
        "title": title,
        "description": description,
        "date": date.toIso8601String(),
      };
}
