import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';
import 'package:healthblock/models/appointment_model.dart';
import 'package:healthblock/partials/body.dart';
import 'package:healthblock/partials/side_nav.dart';
import 'package:healthblock/screens/new_appointment_success.dart';
import 'package:healthblock/services/service.dart';
import 'package:healthblock/storage/local_storage.dart';
import 'package:healthblock/utils.dart';
import 'package:healthblock/widgets/button.dart';
import 'package:healthblock/widgets/heading.dart';
import 'package:healthblock/widgets/healthblock_card.dart';
import 'package:healthblock/widgets/single_text_information.dart';

import 'login.dart';

class NewAppointment extends StatefulWidget {
  static const String id = 'newAppointment';

  @override
  _NewAppointment createState() => _NewAppointment();
}

class _NewAppointment extends State<NewAppointment> {
  String placeholder =
      'Confirm patient information before proceeding to book an appointment';
  String id;
  int patient;
  //TODO: get staff id
  int doctor = 1;

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
            activeScreen: 4,
          ),
          Body(
            child: Column(
              children: [
                Heading(heading: 'New Appointment'),
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
                                    'Patient Number',
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
                                      hintText: "HB345",
                                    ),
                                    onChanged: (value) => {
                                      id = value,
                                      if (id.isEmpty)
                                        {
                                          setState(() {
                                            placeholder =
                                                'Confirm patient information before proceeding to book an appointment';
                                          }),
                                        }
                                      else
                                        {
                                          confirmPatient(id),
                                          patient = int.parse(id),
                                        },
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            SingleInformation(
                              title: 'Patient Confirmation',
                              data: placeholder,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: PrimaryButton(
                                onPressed: () => {
                                  bookAppointment(),
                                },
                                text: 'Book appointment',
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

  void bookAppointment() {
    Appointment newAppointment = Appointment(patient: patient, doctor: doctor);
    var body = appointmentToJson(newAppointment);
    Services.setAppointment(body: body).then((value) => {
          Navigator.pushNamed(context, AppointmentSuccess.id, arguments: value),
          Utils.successToast('Appointment booked successfully'),
        });
  }

  void confirmPatient(id) {
    Services.getPatientInformation(id)
        .then((value) => {
              setState(() {
                placeholder = value.patient.name +
                    ' from ' +
                    value.patient.address +
                    ' with mobile ' +
                    value.patient.telephone;
              }),
            })
        .catchError((onError) {
      setState(() {
        placeholder = 'Unable to find patient data';
      });
    });
  }

  // {
  // "patient": {
  // "name": "Amina Muhammad",
  // "age": "20",
  // "address": "Kano, Nigeria",
  // "telephone": "08078678765",
  // "next_of_kin": "Aisha Muhammad",
  // "next_of_kin_telephone": "08078987867",
  // "next_of_kin_address": "Kano, Nigeria",
  // "next_of_kin_relationship": "Mum"
  // },
  // "medical_history": "No recorded history",
  // "family_history": "No recorded history"
  // }
}
