import 'dart:convert';

Patient patientFromJson(String str) => Patient.fromJson(json.decode(str));

String patientToJson(Patient data) => json.encode(data.toJson());

class Patient {
  Patient({
    this.id,
    this.firstName,
    this.lastName,
    this.age,
    this.address,
    this.telephone,
    this.nextOfKinFirstName,
    this.nextOfKinLastName,
    this.nextOfKinAddress,
    this.nextOfKinTelephone,
    this.nextOfKinRelationship,
    this.status,
  });

  int id;
  String firstName;
  String lastName;
  String age;
  String address;
  String telephone;
  String nextOfKinFirstName;
  String nextOfKinLastName;
  String nextOfKinAddress;
  String nextOfKinTelephone;
  String nextOfKinRelationship;
  bool status;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        age: json["age"],
        address: json["address"],
        telephone: json["telephone"],
        nextOfKinFirstName: json["next_of_kin_first_name"],
        nextOfKinLastName: json["next_of_kin_last_name"],
        nextOfKinAddress: json["next_of_kin_address"],
        nextOfKinTelephone: json["next_of_kin_telephone"],
        nextOfKinRelationship: json["next_of_kin_relationship"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "age": age,
        "address": address,
        "telephone": telephone,
        "next_of_kin_first_name": nextOfKinFirstName,
        "next_of_kin_last_name": nextOfKinLastName,
        "next_of_kin_address": nextOfKinAddress,
        "next_of_kin_telephone": nextOfKinTelephone,
        "next_of_kin_relationship": nextOfKinRelationship,
        "status": status,
      };
}
