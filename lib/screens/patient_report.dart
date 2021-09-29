import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';
import 'package:healthblock/models/patient_report_model.dart';
import 'package:healthblock/partials/body.dart';
import 'package:healthblock/partials/side_nav.dart';
import 'package:healthblock/partials/tile_item.dart';
import 'package:healthblock/partials/tile_title.dart';
import 'package:healthblock/screens/login.dart';
import 'package:healthblock/services/service.dart';
import 'package:healthblock/storage/local_storage.dart';
import 'package:healthblock/utils.dart';
import 'package:healthblock/widgets/heading.dart';
import 'package:healthblock/widgets/healthblock_card.dart';
import 'package:healthblock/widgets/information_row.dart';
import 'package:healthblock/widgets/no_message.dart';
import 'package:healthblock/widgets/single_text_information.dart';

class PatientReportScreen extends StatefulWidget {
  static const String id = 'patient_report_string';
  final PatientReport patientReport;

  PatientReportScreen({Key key, this.patientReport}) : super(key: key);

  @override
  _PatientReportScreenState createState() => _PatientReportScreenState();
}

class _PatientReportScreenState extends State<PatientReportScreen> {
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
    final args = ModalRoute.of(context).settings.arguments as PatientReport;
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
          SideNav(activeScreen: 6),
          Body(
            child: ListView(
              children: [
                Heading(heading: 'Patient Information'),
                Column(
                  children: [
                    HealthblockCard(
                      child: Column(
                        children: [
                          InformationRow(
                            fTitle: 'Patient Number',
                            sTitle: 'Patient Name',
                            fData: args.patient.id.toString(),
                            sData: args.patient.name,
                          ),
                          InformationRow(
                            fTitle: 'Age',
                            sTitle: 'Telephone',
                            fData: args.patient.age,
                            sData: args.patient.telephone,
                          ),
                          InformationRow(
                            fTitle: 'Address',
                            sTitle: 'Next of kin',
                            fData: args.patient.address,
                            sData: args.patient.nextOfKin,
                          ),
                          InformationRow(
                            fTitle: 'Relationship with next of kin',
                            sTitle: 'Next of kin address',
                            fData: args.patient.nextOfKinRelationship,
                            sData: args.patient.nextOfKinAddress,
                          ),
                          InformationRow(
                            fTitle: 'Next of kin telephone',
                            sTitle: 'Patient admission status',
                            fData: args.patient.nextOfKinTelephone,
                            sData: args.patient.status,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Heading(heading: 'Patient Past Medical History'),
                Column(
                  children: [
                    HealthblockCard(
                      child: args.medicalHistory.isEmpty
                          ? NoData(
                              message: 'No past medical history',
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: args.medicalHistory.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    SingleInformation(
                                        title: args.medicalHistory[index]
                                            .classification,
                                        data: args
                                            .medicalHistory[index].description),
                                  ],
                                );
                              },
                            ),
                    ),
                  ],
                ),
                Heading(heading: 'Patient Family and Social History'),
                Column(
                  children: [
                    HealthblockCard(
                      child: args.familyHistory.isEmpty
                          ? NoData(
                              message: 'No family and social history',
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: args.familyHistory.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    SingleInformation(
                                        title: args.familyHistory[index]
                                            .classification,
                                        data: args
                                            .familyHistory[index].description),
                                  ],
                                );
                              },
                            ),
                    ),
                  ],
                ),
                Heading(heading: 'Patient Treatment History'),
                Column(
                  children: [
                    HealthblockCard(
                      child: args.treatmentData.isEmpty
                          ? NoData(
                              message: 'No recorded treatment data',
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: args.treatmentData.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Column(
                                    children: [
                                      InformationRow(
                                        fTitle: 'Patient No',
                                        sTitle: 'Doctor No',
                                        fData: args.treatmentData[index].patient
                                            .toString(),
                                        sData: args.treatmentData[index].doctor
                                            .toString(),
                                      ),
                                      InformationRow(
                                        fTitle: 'Date',
                                        sTitle: 'Title',
                                        fData: args.treatmentData[index].date
                                            .toString(),
                                        sData: args.treatmentData[index].title
                                            .toString(),
                                      ),
                                      Row(
                                        children: [
                                          SingleInformation(
                                            title: 'Treatment',
                                            data: args.treatmentData[index]
                                                .description
                                                .toString(),
                                          ),
                                        ],
                                      ),
                                      Divider(),
                                    ],
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
                Heading(heading: 'Patient Complaint History'),
                Column(
                  children: [
                    HealthblockCard(
                      child: args.complaintData.isEmpty
                          ? NoData(
                              message: 'No recorded complaint data',
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: args.complaintData.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Column(
                                    children: [
                                      InformationRow(
                                        fTitle: 'Patient No',
                                        sTitle: 'Doctor No',
                                        fData: args.complaintData[index].patient
                                            .toString(),
                                        sData: args.complaintData[index].doctor
                                            .toString(),
                                      ),
                                      InformationRow(
                                        fTitle: 'Date',
                                        sTitle: 'Title',
                                        fData: args.complaintData[index].date
                                            .toString(),
                                        sData: args.complaintData[index].title
                                            .toString(),
                                      ),
                                      Row(
                                        children: [
                                          SingleInformation(
                                            title: 'Complaint',
                                            data: args.complaintData[index]
                                                .description
                                                .toString(),
                                          ),
                                        ],
                                      ),
                                      Divider(),
                                    ],
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
                Heading(heading: 'Patient Clinical Examination History'),
                Column(
                  children: [
                    HealthblockCard(
                      child: args.examData.isEmpty
                          ? NoData(
                              message: 'No recorded investigation data',
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: args.examData.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Column(
                                    children: [
                                      InformationRow(
                                        fTitle: 'Patient No',
                                        sTitle: 'Doctor No',
                                        fData: args.examData[index].patient
                                            .toString(),
                                        sData: args.examData[index].doctor
                                            .toString(),
                                      ),
                                      InformationRow(
                                        fTitle: 'Date',
                                        sTitle: 'Exam Title',
                                        fData: args.examData[index].date
                                            .toString(),
                                        sData: args.examData[index].title
                                            .toString(),
                                      ),
                                      Row(
                                        children: [
                                          SingleInformation(
                                            title: 'Exam desc',
                                            data: args
                                                .examData[index].description
                                                .toString(),
                                          ),
                                        ],
                                      ),
                                      args.examData[index].diagnosis.isEmpty
                                          ? Row(
                                              children: [
                                                SingleInformation(
                                                  title: 'Diagnosis',
                                                  data: 'No diagnosis',
                                                ),
                                              ],
                                            )
                                          : Row(
                                              children: [
                                                SingleInformation(
                                                  title: 'Diagnosis',
                                                  data: args.examData[index]
                                                      .diagnosis[0].description
                                                      .toString(),
                                                ),
                                              ],
                                            ),
                                      Divider(),
                                    ],
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
                Heading(heading: 'Patient Investigation History'),
                Column(
                  children: [
                    HealthblockCard(
                      child: args.investigationData.isEmpty
                          ? NoData(
                              message: 'No recorded investigation data',
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: args.investigationData.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Column(
                                    children: [
                                      InformationRow(
                                        fTitle: 'Patient No',
                                        sTitle: 'Doctor No',
                                        fData: args
                                            .investigationData[index].patient
                                            .toString(),
                                        sData: args
                                            .investigationData[index].doctor
                                            .toString(),
                                      ),
                                      InformationRow(
                                        fTitle: 'Date',
                                        sTitle: 'Investigation requested',
                                        fData: args
                                            .investigationData[index].date
                                            .toString(),
                                        sData: args
                                            .investigationData[index].title
                                            .toString(),
                                      ),
                                      Row(
                                        children: [
                                          SingleInformation(
                                            title: 'Investigation result',
                                            data: args.investigationData[index]
                                                .description
                                                .toString(),
                                          ),
                                        ],
                                      ),
                                      Divider(),
                                    ],
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
                Heading(heading: 'Patient Activity History'),
                Column(
                  children: [
                    HealthblockCard(
                      child: args.patientActivites.isEmpty
                          ? NoData(
                              message: 'No recorded patient activity data',
                            )
                          : Column(
                              children: [
                                TileTitle(
                                  fTitle: 'Recorded by',
                                  sTitle: 'Patient Action',
                                  tTitle: 'Date & Time',
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: args.patientActivites.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        TileItem(
                                          patientNo: args
                                              .patientActivites[index].staff,
                                          name: args.patientActivites[index]
                                              .description,
                                          status:
                                              args.patientActivites[index].date,
                                          onPressed: () => {},
                                        ),
                                        Divider(),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
