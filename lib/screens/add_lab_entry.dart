import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';
import 'package:healthblock/models/active_investigations_model.dart';
import 'package:healthblock/models/investigation_model.dart';
import 'package:healthblock/partials/body.dart';
import 'package:healthblock/partials/side_nav.dart';
import 'package:healthblock/screens/login.dart';
import 'package:healthblock/services/service.dart';
import 'package:healthblock/storage/local_storage.dart';
import 'package:healthblock/utils.dart';
import 'package:healthblock/widgets/button.dart';
import 'package:healthblock/widgets/heading.dart';
import 'package:healthblock/widgets/healthblock_card.dart';
import 'package:healthblock/widgets/information_row.dart';

class AddLabEntry extends StatefulWidget {
  static const String id = 'add_lab_entry';
  final investigationRequest;
  const AddLabEntry({Key key, this.investigationRequest}) : super(key: key);

  @override
  _AddLabEntryState createState() => _AddLabEntryState();
}

class _AddLabEntryState extends State<AddLabEntry> {
  String title;
  String note;
  final titleFieldController = TextEditingController();
  final noteFieldController = TextEditingController();

  void _clearFields() {
    titleFieldController.clear();
    noteFieldController.clear();
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
    final activeInvestigation =
        ModalRoute.of(context).settings.arguments as ActiveInvestigations;
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
          SideNav(activeScreen: 5),
          Body(
            child: Column(
              children: [
                Heading(heading: 'Patient Investigation'),
                HealthblockCard(
                  child: Column(
                    children: [
                      InformationRow(
                        fTitle: 'Patient Number',
                        sTitle: 'Investigation Requested',
                        fData: activeInvestigation.patient.toString(),
                        sData: activeInvestigation.description,
                      ),
                    ],
                  ),
                ),
                Heading(heading: 'Patient Investigation Result'),
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
                                      hintText: "Investigation Carried",
                                    ),
                                    onChanged: (value) => {
                                      title = value,
                                    },
                                    controller: titleFieldController,
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
                                      hintText: "Investigation Result",
                                    ),
                                    onChanged: (value) => {
                                      note = value,
                                    },
                                    controller: noteFieldController,
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
                                  if (title == null ||
                                      note == null ||
                                      title.isEmpty ||
                                      note.isEmpty)
                                    {
                                      Utils.errorToast(
                                          'Investigation data can\'t be empty'),
                                    }
                                  else
                                    {
                                      _postInvestigationData(
                                          activeInvestigation.patient,
                                          activeInvestigation.id),
                                    }
                                },
                                text: 'Add Investigation',
                              ),
                            ),
                          ),
                          Expanded(child: Container())
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _postInvestigationData(patient, investigationId) async {
    DateTime now = DateTime.now();
    int doctor = await LocalStorage.getStaffId();

    PatientData patientData = PatientData(
      patient: patient,
      investigationId: investigationId,
      doctor: doctor,
      hdataType: 'investigation_data',
      title: title,
      description: note,
      date: now.toString(),
    );

    InvestigationModel investigationModel = InvestigationModel(
      patient: patient,
      practicioner: doctor,
      metaData: 'investigation_data',
      patientData: patientData,
      description: 'patient investigation data',
      time: now.toString(),
    );

    var body = investigationModelToJson(investigationModel);

    Services.addBlockData(body)
        .then((value) => {
              _clearFields(),
              Utils.successToast('Result added successfully'),
            })
        .catchError((onError) {
      Utils.errorToast('Unable to store investigation data, try again pls');
    });
  }
}

// int patient;
// int practicioner;
// String metaData;
// PatientData patientData;
// String description;
// String time;

// int investigationId;
// int patient;
// int doctor;
// String hdataType;
// String title;
// String description;
// String date;
