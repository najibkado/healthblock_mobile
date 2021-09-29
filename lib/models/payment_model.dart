// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

Payment paymentFromJson(String str) => Payment.fromJson(json.decode(str));

String paymentToJson(Payment data) => json.encode(data.toJson());

class Payment {
  Payment({
    this.investigation,
    this.patient,
    this.amountPaid,
  });

  int investigation;
  int patient;
  String amountPaid;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        investigation: json["investigation"],
        patient: json["patient"],
        amountPaid: json["amount_paid"],
      );

  Map<String, dynamic> toJson() => {
        "investigation": investigation,
        "patient": patient,
        "amount_paid": amountPaid,
      };
}
