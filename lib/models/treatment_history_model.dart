// To parse this JSON data, do
//
//     final treatmentHistory = treatmentHistoryFromJson(jsonString);

import 'dart:convert';

TreatmentHistory treatmentHistoryFromJson(String str) =>
    TreatmentHistory.fromJson(json.decode(str));

String treatmentHistoryToJson(TreatmentHistory data) =>
    json.encode(data.toJson());

class TreatmentHistory {
  TreatmentHistory({
    this.treatments,
    this.exams,
    this.investigations,
  });

  List<Exam> treatments;
  List<Exam> exams;
  List<Exam> investigations;

  factory TreatmentHistory.fromJson(Map<String, dynamic> json) =>
      TreatmentHistory(
        treatments:
            List<Exam>.from(json["treatments"].map((x) => Exam.fromJson(x))),
        exams: List<Exam>.from(json["exams"].map((x) => Exam.fromJson(x))),
        investigations: List<Exam>.from(
            json["investigations"].map((x) => Exam.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "treatments": List<dynamic>.from(treatments.map((x) => x.toJson())),
        "exams": List<dynamic>.from(exams.map((x) => x.toJson())),
        "investigations":
            List<dynamic>.from(investigations.map((x) => x.toJson())),
      };
}

class Exam {
  Exam({
    this.patient,
    this.doctor,
    this.hdataType,
    this.title,
    this.description,
    this.date,
    this.diagnosis,
    this.investigationId,
  });

  int patient;
  int doctor;
  String hdataType;
  String title;
  String description;
  DateTime date;
  List<Diagnosis> diagnosis;
  int investigationId;

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
        patient: json["patient"],
        doctor: json["doctor"],
        hdataType: json["hdata_type"],
        title: json["title"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        diagnosis: json["diagnosis"] == null
            ? null
            : List<Diagnosis>.from(
                json["diagnosis"].map((x) => Diagnosis.fromJson(x))),
        investigationId:
            json["investigation_id"] == null ? null : json["investigation_id"],
      );

  Map<String, dynamic> toJson() => {
        "patient": patient,
        "doctor": doctor,
        "hdata_type": hdataType,
        "title": title,
        "description": description,
        "date": date.toIso8601String(),
        "diagnosis": diagnosis == null
            ? null
            : List<dynamic>.from(diagnosis.map((x) => x.toJson())),
        "investigation_id": investigationId == null ? null : investigationId,
      };
}

class Diagnosis {
  Diagnosis({
    this.hdataType,
    this.description,
    this.date,
  });

  String hdataType;
  String description;
  DateTime date;

  factory Diagnosis.fromJson(Map<String, dynamic> json) => Diagnosis(
        hdataType: json["hdata_type"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "hdata_type": hdataType,
        "description": description,
        "date": date.toIso8601String(),
      };
}
