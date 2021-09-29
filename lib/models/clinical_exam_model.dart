// To parse this JSON data, do
//
//     final examModel = examModelFromJson(jsonString);

import 'dart:convert';

ExamModel examModelFromJson(String str) => ExamModel.fromJson(json.decode(str));

String examModelToJson(ExamModel data) => json.encode(data.toJson());

class ExamModel {
  ExamModel({
    this.patient,
    this.practicioner,
    this.metaData,
    this.patientData,
    this.description,
    this.time,
  });

  int patient;
  int practicioner;
  String metaData;
  PatientData patientData;
  String description;
  String time;

  factory ExamModel.fromJson(Map<String, dynamic> json) => ExamModel(
        patient: json["patient"],
        practicioner: json["practicioner"],
        metaData: json["meta_data"],
        patientData: PatientData.fromJson(json["patient_data"]),
        description: json["description"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "patient": patient,
        "practicioner": practicioner,
        "meta_data": metaData,
        "patient_data": patientData.toJson(),
        "description": description,
        "time": time,
      };
}

class PatientData {
  PatientData({
    this.patient,
    this.doctor,
    this.hdataType,
    this.title,
    this.description,
    this.date,
    this.diagnosis,
  });

  int patient;
  int doctor;
  String hdataType;
  String title;
  String description;
  String date;
  List<Diagnosis> diagnosis;

  factory PatientData.fromJson(Map<String, dynamic> json) => PatientData(
        patient: json["patient"],
        doctor: json["doctor"],
        hdataType: json["hdata_type"],
        title: json["title"],
        description: json["description"],
        date: json["date"],
        diagnosis: List<Diagnosis>.from(
            json["diagnosis"].map((x) => Diagnosis.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "patient": patient,
        "doctor": doctor,
        "hdata_type": hdataType,
        "title": title,
        "description": description,
        "date": date,
        "diagnosis": List<dynamic>.from(diagnosis.map((x) => x.toJson())),
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
  String date;

  factory Diagnosis.fromJson(Map<String, dynamic> json) => Diagnosis(
        hdataType: json["hdata_type"],
        description: json["description"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "hdata_type": hdataType,
        "description": description,
        "date": date,
      };
}
