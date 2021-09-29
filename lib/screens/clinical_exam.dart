import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';
import 'package:healthblock/models/clinical_exam_model.dart';
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

class ClinicalExam extends StatefulWidget {
  static const String id = 'clinical_exam';
  final int activePatient;
  const ClinicalExam({Key key, this.activePatient}) : super(key: key);

  @override
  _ClinicalExamState createState() => _ClinicalExamState();
}

class _ClinicalExamState extends State<ClinicalExam> {
  String examTitle;
  String examNote;
  String examDiagnosis;
  final _titleFieldController = TextEditingController();
  final _noteFieldController = TextEditingController();
  final _diagnosisFieldController = TextEditingController();

  void _clearFields() {
    _titleFieldController.clear();
    _noteFieldController.clear();
    _diagnosisFieldController.clear();
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
                HeadNav(activePatient: patientNumber, activeScreen: 4),
                Heading(heading: 'New Clinical Exam'),
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
                                      hintText: "Examination title",
                                    ),
                                    onChanged: (value) => {
                                      examTitle = value,
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
                                    maxLines: 10,
                                    decoration: kTextFieldDecoration.copyWith(
                                      hintText: "Examination note",
                                    ),
                                    onChanged: (value) => {
                                      examNote = value,
                                    },
                                    controller: _noteFieldController,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Diagnosis',
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
                                    maxLines: 10,
                                    decoration: kTextFieldDecoration.copyWith(
                                      hintText: "Diagnosis if any",
                                    ),
                                    onChanged: (value) => {
                                      examDiagnosis = value,
                                    },
                                    controller: _diagnosisFieldController,
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
                                  if (examNote == null ||
                                      examTitle == null ||
                                      examNote.isEmpty ||
                                      examTitle.isEmpty)
                                    {
                                      Utils.errorToast(
                                          'Examination data cant be empty'),
                                    }
                                  else if (examDiagnosis == null ||
                                      examDiagnosis.isEmpty)
                                    {
                                      examDiagnosis = "No diagnosis",
                                    }
                                  else
                                    {
                                      _postData(patientNumber),
                                    },
                                },
                                text: 'Add Examination',
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

  _postData(patientNumber) async {
    DateTime now = DateTime.now();
    int doctor = await LocalStorage.getStaffId();
    Diagnosis diagnosis = Diagnosis(
      hdataType: 'exam_diagnosis',
      description: examDiagnosis,
      date: now.toString(),
    );
    PatientData patientData = PatientData(
      patient: patientNumber,
      doctor: doctor,
      hdataType: 'exam_data',
      title: examTitle,
      description: examNote,
      date: now.toString(),
      diagnosis: [diagnosis],
    );

    ExamModel examModel = ExamModel(
      patient: patientNumber,
      metaData: 'exam_data',
      patientData: patientData,
      description: 'clinical exam data',
      time: now.toString(),
    );

    var body = examModelToJson(examModel);

    Services.addBlockData(body)
        .then((value) => {
              _clearFields(),
              Utils.successToast('Exam data stored successfully'),
            })
        .catchError((onError) {
      Utils.errorToast('Unable to store exam data, try again');
    });
  }
}

// int patient;
// int practicioner;
// String metaData;
// PatientData patientData;
// String description;
// String time;

// String hdataType;
// String description;
// String date;

// int patient;
// int doctor;
// String hdataType;
// String title;
// String description;
// String date;
// List<Diagnosis> diagnosis;
