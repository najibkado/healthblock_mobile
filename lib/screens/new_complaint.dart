import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';
import 'package:healthblock/models/complaint_model.dart';
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

class NewComplaint extends StatefulWidget {
  static const String id = 'new_complaint';
  final int activePatient;
  const NewComplaint({Key key, this.activePatient}) : super(key: key);

  @override
  _NewComplaintState createState() => _NewComplaintState();
}

class _NewComplaintState extends State<NewComplaint> {
  String complaintTitle;
  String complaintNote;
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
                HeadNav(activePatient: patientNumber, activeScreen: 2),
                Heading(heading: 'New Complaint'),
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
                                      hintText: "Complaint title",
                                    ),
                                    onChanged: (value) => {
                                      complaintTitle = value,
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
                                      hintText: "Complaint note",
                                    ),
                                    onChanged: (value) => {
                                      complaintNote = value,
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
                                  if (complaintTitle == null ||
                                      complaintNote == null ||
                                      complaintTitle.isEmpty ||
                                      complaintNote.isEmpty)
                                    {
                                      Utils.errorToast(
                                          'Complaint data can\'t be empty'),
                                    }
                                  else
                                    {
                                      _postData(patientNumber),
                                    },
                                },
                                text: 'Add complaint',
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

  void _postData(patientNumber) async {
    DateTime now = DateTime.now();
    int doctor = await LocalStorage.getStaffId();
    PatientData patientData = PatientData(
      patient: patientNumber,
      doctor: doctor,
      hdataType: 'complaint_data',
      title: complaintTitle,
      description: complaintNote,
      date: now.toString(),
    );

    ComplaintModel complaintModel = ComplaintModel(
      patient: patientNumber,
      practicioner: doctor,
      metaData: 'complaint_data',
      patientData: patientData,
      description: 'patient complaint data',
      time: now.toString(),
    );

    var data = complaintModelToJson(complaintModel);

    Services.addBlockData(data)
        .then((value) => {
              _clearFields(),
              Utils.successToast('Complaint added successfully'),
            })
        .catchError((onError) {
      Utils.errorToast('Error saving data, try again');
      print('error getting data');
    });
  }
}
