// To parse this JSON data, do
//
//     final patientReport = patientReportFromJson(jsonString);

import 'dart:convert';

PatientReport patientReportFromJson(String str) =>
    PatientReport.fromJson(json.decode(str));

String patientReportToJson(PatientReport data) => json.encode(data.toJson());

class PatientReport {
  PatientReport({
    this.patient,
    this.medicalHistory,
    this.familyHistory,
    this.patientActivites,
    this.treatmentData,
    this.complaintData,
    this.examData,
    this.investigationData,
  });

  Patient patient;
  List<History> medicalHistory;
  List<History> familyHistory;
  List<PatientActivite> patientActivites;
  List<Datum> treatmentData;
  List<Datum> complaintData;
  List<Datum> examData;
  List<Datum> investigationData;

  factory PatientReport.fromJson(Map<String, dynamic> json) => PatientReport(
        patient: Patient.fromJson(json["patient"]),
        medicalHistory: List<History>.from(
            json["medical_history"].map((x) => History.fromJson(x))),
        familyHistory: List<History>.from(
            json["family_history"].map((x) => History.fromJson(x))),
        patientActivites: List<PatientActivite>.from(
            json["patient_activites"].map((x) => PatientActivite.fromJson(x))),
        treatmentData: List<Datum>.from(
            json["treatment_data"].map((x) => Datum.fromJson(x))),
        complaintData: List<Datum>.from(
            json["complaint_data"].map((x) => Datum.fromJson(x))),
        examData:
            List<Datum>.from(json["exam_data"].map((x) => Datum.fromJson(x))),
        investigationData: List<Datum>.from(
            json["investigation_data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "patient": patient.toJson(),
        "medical_history":
            List<dynamic>.from(medicalHistory.map((x) => x.toJson())),
        "family_history":
            List<dynamic>.from(familyHistory.map((x) => x.toJson())),
        "patient_activites":
            List<dynamic>.from(patientActivites.map((x) => x.toJson())),
        "treatment_data":
            List<dynamic>.from(treatmentData.map((x) => x.toJson())),
        "complaint_data":
            List<dynamic>.from(complaintData.map((x) => x.toJson())),
        "exam_data": List<dynamic>.from(examData.map((x) => x.toJson())),
        "investigation_data":
            List<dynamic>.from(investigationData.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        patient: json["patient"],
        doctor: json["doctor"],
        hdataType: json["hdata_type"],
        title: json["title"],
        description: json["description"],
        date: json["date"],
        diagnosis: json["diagnosis"] == null
            ? null
            : List<Diagnosis>.from(
                json["diagnosis"].map((x) => Diagnosis.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "patient": patient,
        "doctor": doctor,
        "hdata_type": hdataType,
        "title": title,
        "description": description,
        "date": date,
        "diagnosis": diagnosis == null
            ? null
            : List<dynamic>.from(diagnosis.map((x) => x.toJson())),
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

class History {
  History({
    this.patient,
    this.classification,
    this.description,
  });

  int patient;
  String classification;
  String description;

  factory History.fromJson(Map<String, dynamic> json) => History(
        patient: json["patient"],
        classification: json["classification"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "patient": patient,
        "classification": classification,
        "description": description,
      };
}

class Patient {
  Patient({
    this.id,
    this.name,
    this.age,
    this.address,
    this.telephone,
    this.nextOfKin,
    this.nextOfKinTelephone,
    this.nextOfKinAddress,
    this.nextOfKinRelationship,
    this.status,
  });

  int id;
  String name;
  String age;
  String address;
  String telephone;
  String nextOfKin;
  String nextOfKinTelephone;
  String nextOfKinAddress;
  String nextOfKinRelationship;
  String status;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        address: json["address"],
        telephone: json["telephone"],
        nextOfKin: json["next_of_kin"],
        nextOfKinTelephone: json["next_of_kin_telephone"],
        nextOfKinAddress: json["next_of_kin_address"],
        nextOfKinRelationship: json["next_of_kin_relationship"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "address": address,
        "telephone": telephone,
        "next_of_kin": nextOfKin,
        "next_of_kin_telephone": nextOfKinTelephone,
        "next_of_kin_address": nextOfKinAddress,
        "next_of_kin_relationship": nextOfKinRelationship,
        "status": status,
      };
}

class PatientActivite {
  PatientActivite({
    this.staff,
    this.patient,
    this.description,
    this.date,
  });

  String staff;
  String patient;
  String description;
  String date;

  factory PatientActivite.fromJson(Map<String, dynamic> json) =>
      PatientActivite(
        staff: json["staff"],
        patient: json["patient"],
        description: json["description"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "staff": staff,
        "patient": patient,
        "description": description,
        "date": date,
      };
}
