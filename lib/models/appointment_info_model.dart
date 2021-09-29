import 'dart:convert';

AppointmentInfo appointmentInfoFromJson(String str) =>
    AppointmentInfo.fromJson(json.decode(str));

String appointmentInfoToJson(AppointmentInfo data) =>
    json.encode(data.toJson());

class AppointmentInfo {
  AppointmentInfo({
    this.appoinmtents,
  });

  List<Appoinmtent> appoinmtents;

  factory AppointmentInfo.fromJson(Map<String, dynamic> json) =>
      AppointmentInfo(
        appoinmtents: List<Appoinmtent>.from(
            json["appoinmtents"].map((x) => Appoinmtent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "appoinmtents": List<dynamic>.from(appoinmtents.map((x) => x.toJson())),
      };
}

class Appoinmtent {
  Appoinmtent({
    this.id,
    this.name,
    this.status,
  });

  int id;
  String name;
  String status;

  factory Appoinmtent.fromJson(Map<String, dynamic> json) => Appoinmtent(
        id: json["id"],
        name: json["name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
      };
}
