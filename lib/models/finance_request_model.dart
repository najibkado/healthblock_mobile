// To parse this JSON data, do
//
//     final financeRequestModel = financeRequestModelFromJson(jsonString);

import 'dart:convert';

List<FinanceRequestModel> financeRequestModelFromJson(String str) =>
    List<FinanceRequestModel>.from(
        json.decode(str).map((x) => FinanceRequestModel.fromJson(x)));

String financeRequestModelToJson(List<FinanceRequestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FinanceRequestModel {
  FinanceRequestModel({
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

  factory FinanceRequestModel.fromJson(Map<String, dynamic> json) =>
      FinanceRequestModel(
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
