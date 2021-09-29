import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';
import 'package:healthblock/models/patient_model.dart';
import 'package:healthblock/partials/body.dart';
import 'package:healthblock/partials/side_nav.dart';
import 'package:healthblock/screens/patient_register_success.dart';
import 'package:healthblock/services/service.dart';
import 'package:healthblock/storage/local_storage.dart';
import 'package:healthblock/utils.dart';
import 'package:healthblock/widgets/button.dart';
import 'package:healthblock/widgets/heading.dart';
import 'package:healthblock/widgets/healthblock_card.dart';
import 'login.dart';

class NewPatient extends StatefulWidget {
  static const String id = 'newPatient';

  @override
  _NewPatientState createState() => _NewPatientState();
}

class _NewPatientState extends State<NewPatient> {
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
  bool status = false;

  void _logout() {
    Services.logoutRequest()
        .then((value) => {
              LocalStorage.clearData(),
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Logout'))),
              Navigator.pushNamed(context, Login.id),
            })
        .catchError((onError) {
      Utils.errorToast('Unable to logout, try again');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(0, 7.0, 0.0, 7.0),
          child: Image.asset('images/logo_white.png'),
        ),
        leadingWidth: 200.0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              _logout();
            },
          ),
        ],
        backgroundColor: kPrimaryColor,
      ),
      body: Row(
        children: [
          SideNav(
            activeScreen: 3,
          ),
          Body(
            child: Column(
              children: [
                Heading(heading: 'New Patient'),
                HealthblockCard(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  TextField(
                                    decoration: kTextFieldDecoration.copyWith(
                                      hintText: "Patient name",
                                    ),
                                    onChanged: (value) => {
                                      firstName = value,
                                      lastName = value,
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Age',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  TextField(
                                    decoration: kTextFieldDecoration.copyWith(
                                      hintText: "Age",
                                    ),
                                    onChanged: (value) => {
                                      age = value,
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Telephone',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  TextField(
                                    decoration: kTextFieldDecoration.copyWith(
                                      hintText: "Telephone",
                                    ),
                                    onChanged: (value) => {
                                      telephone = value,
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Address',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  TextField(
                                    decoration: kTextFieldDecoration.copyWith(
                                      hintText: "Patient address",
                                    ),
                                    onChanged: (value) => {
                                      address = value,
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name of next of kin',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  TextField(
                                    decoration: kTextFieldDecoration.copyWith(
                                      hintText: "Next of kin",
                                    ),
                                    onChanged: (value) => {
                                      nextOfKinFirstName = value,
                                      nextOfKinLastName = value,
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Relationship',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  TextField(
                                    decoration: kTextFieldDecoration.copyWith(
                                      hintText: "Relationship with patient",
                                    ),
                                    onChanged: (value) => {
                                      nextOfKinRelationship = value,
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Telephone',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  TextField(
                                    decoration: kTextFieldDecoration.copyWith(
                                      hintText: "Next of kin telephone",
                                    ),
                                    onChanged: (value) => {
                                      nextOfKinTelephone = value,
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Next of kin address',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  TextField(
                                    decoration: kTextFieldDecoration.copyWith(
                                      hintText: "Next of kin address",
                                    ),
                                    onChanged: (value) => {
                                      nextOfKinAddress = value,
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: PrimaryButton(
                                onPressed: () => {
                                  if (firstName.isEmpty ||
                                      lastName.isEmpty ||
                                      age.isEmpty ||
                                      address.isEmpty ||
                                      telephone.isEmpty ||
                                      nextOfKinAddress.isEmpty ||
                                      nextOfKinFirstName.isEmpty ||
                                      nextOfKinLastName.isEmpty ||
                                      nextOfKinRelationship.isEmpty ||
                                      nextOfKinTelephone.isEmpty)
                                    {
                                      Utils.errorToast(
                                          'Patient data can\'t be empty'),
                                    }
                                  else
                                    {
                                      storePatient(),
                                    },
                                },
                                text: 'Register patient',
                              ),
                            ),
                          ),
                          Expanded(child: Container())
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  storePatient() {
    Patient sample = Patient(
      firstName: firstName,
      lastName: lastName,
      age: age,
      address: address,
      telephone: telephone,
      nextOfKinFirstName: nextOfKinFirstName,
      nextOfKinLastName: nextOfKinLastName,
      nextOfKinAddress: nextOfKinAddress,
      nextOfKinTelephone: nextOfKinTelephone,
      nextOfKinRelationship: nextOfKinRelationship,
      status: status,
    );

    var newPatient = patientToJson(sample);
    // {
    //   "firstName": firstName,
    //   "lastName": lastName,
    //   "age": age,
    //   "address": address,
    //   "telephone": telephone,
    //   "nextOfKinFirstName": nextOfKinFirstName,
    //   "nextOfKinLastName": nextOfKinLastName,
    //   "nextOfKinAddress": nextOfKinAddress,
    //   "nextOfKinTelephone": nextOfKinTelephone,
    //   "nextOfKinRelationship": nextOfKinRelationship,
    //   "status": status,
    // };

    Services.patientSetRequest(body: newPatient)
        .then((value) => {
              Navigator.pushNamed(context, PatientRegSuccess.id,
                  arguments: value)
            })
        // ignore: return_of_invalid_type_from_catch_error
        .catchError((onError) => {
              Utils.errorToast(
                  'Unable to register new patient, try again please'),
            });
  }
}
