// To parse this JSON data, do
//
//     final patientInformation = patientInformationFromJson(jsonString);

import 'dart:convert';

PatientInformation patientInformationFromJson(String str) =>
    PatientInformation.fromJson(json.decode(str));

String patientInformationToJson(PatientInformation data) =>
    json.encode(data.toJson());

class PatientInformation {
  PatientInformation({
    this.patient,
    this.medicalHistory,
    this.familyHistory,
  });

  Patient patient;
  List<History> medicalHistory;
  List<History> familyHistory;

  factory PatientInformation.fromJson(Map<String, dynamic> json) =>
      PatientInformation(
        patient: Patient.fromJson(json["patient"]),
        medicalHistory: List<History>.from(
            json["medical_history"].map((x) => History.fromJson(x))),
        familyHistory: List<History>.from(
            json["family_history"].map((x) => History.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "patient": patient.toJson(),
        "medical_history":
            List<dynamic>.from(medicalHistory.map((x) => x.toJson())),
        "family_history":
            List<dynamic>.from(familyHistory.map((x) => x.toJson())),
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
