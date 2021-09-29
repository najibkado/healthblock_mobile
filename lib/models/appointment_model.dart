// To parse this JSON data, do
//
//     final appointment = appointmentFromJson(jsonString);

import 'dart:convert';

Appointment appointmentFromJson(String str) =>
    Appointment.fromJson(json.decode(str));

String appointmentToJson(Appointment data) => json.encode(data.toJson());

class Appointment {
  Appointment({
    this.patient,
    this.doctor,
  });

  int patient;
  int doctor;

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        patient: json["patient"],
        doctor: json["doctor"],
      );

  Map<String, dynamic> toJson() => {
        "patient": patient,
        "doctor": doctor,
      };
}
