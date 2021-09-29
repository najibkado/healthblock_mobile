// To parse this JSON data, do
//
//     final requestInvestgationModel = requestInvestgationModelFromJson(jsonString);

import 'dart:convert';

RequestInvestgationModel requestInvestgationModelFromJson(String str) =>
    RequestInvestgationModel.fromJson(json.decode(str));

String requestInvestgationModelToJson(RequestInvestgationModel data) =>
    json.encode(data.toJson());

class RequestInvestgationModel {
  RequestInvestgationModel({
    this.patient,
    this.staff,
    this.description,
  });

  int patient;
  int staff;
  String description;

  factory RequestInvestgationModel.fromJson(Map<String, dynamic> json) =>
      RequestInvestgationModel(
        patient: json["patient"],
        staff: json["staff"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "patient": patient,
        "staff": staff,
        "description": description,
      };
}
