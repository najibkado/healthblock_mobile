// To parse this JSON data, do
//
//     final activeInvestigations = activeInvestigationsFromJson(jsonString);

import 'dart:convert';

List<ActiveInvestigations> activeInvestigationsFromJson(String str) =>
    List<ActiveInvestigations>.from(
        json.decode(str).map((x) => ActiveInvestigations.fromJson(x)));

String activeInvestigationsToJson(List<ActiveInvestigations> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ActiveInvestigations {
  ActiveInvestigations({
    this.id,
    this.patient,
    this.staff,
    this.description,
    this.isPaid,
  });

  int id;
  int patient;
  int staff;
  String description;
  bool isPaid;

  factory ActiveInvestigations.fromJson(Map<String, dynamic> json) =>
      ActiveInvestigations(
        id: json["id"],
        patient: json["patient"],
        staff: json["staff"],
        description: json["description"],
        isPaid: json["is_paid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "patient": patient,
        "staff": staff,
        "description": description,
        "is_paid": isPaid,
      };
}
