// To parse this JSON data, do
//
//     final complaintModel = complaintModelFromJson(jsonString);

import 'dart:convert';

ComplaintModel complaintModelFromJson(String str) =>
    ComplaintModel.fromJson(json.decode(str));

String complaintModelToJson(ComplaintModel data) => json.encode(data.toJson());

class ComplaintModel {
  ComplaintModel({
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

  factory ComplaintModel.fromJson(Map<String, dynamic> json) => ComplaintModel(
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
  });

  int patient;
  int doctor;
  String hdataType;
  String title;
  String description;
  String date;

  factory PatientData.fromJson(Map<String, dynamic> json) => PatientData(
        patient: json["patient"],
        doctor: json["doctor"],
        hdataType: json["hdata_type"],
        title: json["title"],
        description: json["description"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "patient": patient,
        "doctor": doctor,
        "hdata_type": hdataType,
        "title": title,
        "description": description,
        "date": date,
      };
}
