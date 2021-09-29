import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';
import 'package:healthblock/models/treatment_model.dart';
import 'package:healthblock/partials/body.dart';
import 'package:healthblock/partials/head_nav.dart';
import 'package:healthblock/partials/side_nav.dart';
import 'package:healthblock/screens/login.dart';
import 'package:healthblock/services/service.dart';
import 'package:healthblock/storage/local_storage.dart';
import 'package:healthblock/utils.dart';
import 'package:healthblock/widgets/button.dart';
import 'package:healthblock/widgets/heading.dart';
import 'package:healthblock/widgets/healthblock_card.dart';

class NewTreatment extends StatefulWidget {
  static const String id = 'new_treatment';
  final int activePatient;

  const NewTreatment({Key key, this.activePatient}) : super(key: key);

  @override
  _NewTreatmentState createState() => _NewTreatmentState();
}

class _NewTreatmentState extends State<NewTreatment> {
  String treatmentTitle;
  String treatmentNote;
  final _titleFieldController = TextEditingController();
  final _noteFieldController = TextEditingController();

  void _clearFields() {
    _titleFieldController.clear();
    _noteFieldController.clear();
  }

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
    final patientNumber = ModalRoute.of(context).settings.arguments;
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
          SideNav(activeScreen: 2),
          Body(
            child: Column(
              children: [
                HeadNav(activePatient: patientNumber, activeScreen: 5),
                Heading(heading: 'New Treatment'),
                HealthblockCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                    'Title',
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
                                      hintText: "Treatment plan",
                                    ),
                                    onChanged: (value) => {
                                      treatmentTitle = value,
                                    },
                                    controller: _titleFieldController,
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
                                    'Note',
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
                                    maxLines: 15,
                                    decoration: kTextFieldDecoration.copyWith(
                                      hintText: "Treatment note",
                                    ),
                                    onChanged: (value) => {
                                      treatmentNote = value,
                                    },
                                    controller: _noteFieldController,
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
                                  if (treatmentTitle == null ||
                                      treatmentNote == null ||
                                      treatmentTitle.isEmpty ||
                                      treatmentNote.isEmpty)
                                    {
                                      Utils.errorToast(
                                          'Treatment data can\'t be empty'),
                                    }
                                  else
                                    {
                                      _postData(patientNumber),
                                    },
                                },
                                text: 'Add treatment',
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

  _postData(patient) async {
    int doctor = await LocalStorage.getStaffId();
    DateTime now = DateTime.now();

    PatientData patientData = PatientData(
      patient: patient,
      doctor: doctor,
      hdataType: 'treatment_data',
      title: treatmentTitle,
      description: treatmentNote,
      date: now.toString(),
    );

    TreatmentModel treatmentModel = TreatmentModel(
      patient: patient,
      practicioner: doctor,
      metaData: 'treatment_data',
      patientData: patientData,
      description: 'Patient treatment record',
      time: now.toString(),
    );

    var body = treatmentModelToJson(treatmentModel);

    Services.addBlockData(body)
        .then((value) => {
              _clearFields(),
              Utils.successToast('Treatment data stored successfully'),
            })
        .catchError((onError) {
      Utils.errorToast('Unable to store treatment data, try again');
    });
  }
}

// int patient;
// int practicioner;
// String metaData;
// PatientData patientData;
// String description;
// String time;

// int patient;
// int doctor;
// String hdataType;
// String title;
// String description;
// String date;
