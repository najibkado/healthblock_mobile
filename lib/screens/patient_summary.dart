import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';
import 'package:healthblock/models/patient_information_model.dart';
import 'package:healthblock/partials/body.dart';
import 'package:healthblock/partials/head_nav.dart';
import 'package:healthblock/partials/side_nav.dart';
import 'package:healthblock/screens/login.dart';
import 'package:healthblock/services/service.dart';
import 'package:healthblock/storage/local_storage.dart';
import 'package:healthblock/utils.dart';
import 'package:healthblock/widgets/heading.dart';
import 'package:healthblock/widgets/healthblock_card.dart';
import 'package:healthblock/widgets/information_row.dart';
import 'package:healthblock/widgets/single_text_information.dart';

class PatientSummary extends StatefulWidget {
  static const String id = 'patientSummary';
  final PatientInformation patientInformation;

  PatientSummary({Key key, this.patientInformation}) : super(key: key);

  @override
  _PatientSummaryState createState() => _PatientSummaryState();
}

class _PatientSummaryState extends State<PatientSummary> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
    final args =
        ModalRoute.of(context).settings.arguments as PatientInformation;
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
            child: args != null
                ? Column(
                    children: [
                      HeadNav(
                        activePatient: args.patient.id,
                        activeScreen: 1,
                      ),
                      Heading(heading: 'Patient Information'),
                      HealthblockCard(
                        flex: 2,
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
                      Heading(heading: 'Past Medical History'),
                      HealthblockCard(
                        flex: 1,
                        child: args.medicalHistory.isEmpty
                            ? Container(
                                child: Center(
                                  child: Text(
                                    'No medical history',
                                    style: kTitleTextDecoration,
                                  ),
                                ),
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
                                          data: args.medicalHistory[index]
                                              .description),
                                    ],
                                  );
                                },
                              ),
                      ),
                      Heading(heading: 'Family and Social History'),
                      HealthblockCard(
                        flex: 1,
                        child: args.familyHistory.isEmpty
                            ? Container(
                                child: Center(
                                  child: Text(
                                    'No family and social history',
                                    style: kTitleTextDecoration,
                                  ),
                                ),
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
                                          data: args.familyHistory[index]
                                              .description),
                                    ],
                                  );
                                },
                              ),
                      ),
                    ],
                  )
                : Container(
                    child: Center(
                      child: Text('Refresh please'),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
