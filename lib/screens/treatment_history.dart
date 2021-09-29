import 'package:flutter/material.dart';
import 'package:healthblock/arguments/treatment_history_arguments.dart';
import 'package:healthblock/constants.dart';
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
import 'package:healthblock/widgets/no_message.dart';
import 'package:healthblock/widgets/single_text_information.dart';

class TreatmentHistory extends StatefulWidget {
  static const String id = 'treatment_history';
  final TreatmentHistoryArguments args;
  const TreatmentHistory({Key key, this.args}) : super(key: key);

  @override
  _TreatmentHistoryState createState() => _TreatmentHistoryState();
}

class _TreatmentHistoryState extends State<TreatmentHistory> {
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
        ModalRoute.of(context).settings.arguments as TreatmentHistoryArguments;
    print(args.toString());
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
                HeadNav(activePatient: args.activePatient, activeScreen: 6),
                Heading(heading: 'Treatment History'),
                HealthblockCard(
                  child: args.treatmentHistory.treatments.isEmpty
                      ? NoData(
                          message: 'No recorded patient treatment data',
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: args.treatmentHistory.treatments.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Column(
                                children: [
                                  InformationRow(
                                    fTitle: 'Patient No',
                                    sTitle: 'Doctor No',
                                    fData: args.treatmentHistory
                                        .treatments[index].patient
                                        .toString(),
                                    sData: args.treatmentHistory
                                        .treatments[index].doctor
                                        .toString(),
                                  ),
                                  InformationRow(
                                    fTitle: 'Date',
                                    sTitle: 'Treatment plan',
                                    fData: args
                                        .treatmentHistory.treatments[index].date
                                        .toString(),
                                    sData: args.treatmentHistory
                                        .treatments[index].title
                                        .toString(),
                                  ),
                                  Row(
                                    children: [
                                      SingleInformation(
                                        title: 'Treatment',
                                        data: args.treatmentHistory
                                            .treatments[index].description
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
                Heading(heading: 'Clinical Exam History'),
                HealthblockCard(
                  child: args.treatmentHistory.exams.isEmpty
                      ? NoData(
                          message: 'No recorded patient examination data',
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: args.treatmentHistory.exams.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Column(
                                children: [
                                  InformationRow(
                                    fTitle: 'Patient No',
                                    sTitle: 'Doctor No',
                                    fData: args
                                        .treatmentHistory.exams[index].patient
                                        .toString(),
                                    sData: args
                                        .treatmentHistory.exams[index].doctor
                                        .toString(),
                                  ),
                                  InformationRow(
                                    fTitle: 'Date',
                                    sTitle: 'Exam title',
                                    fData: args
                                        .treatmentHistory.exams[index].date
                                        .toString(),
                                    sData: args
                                        .treatmentHistory.exams[index].title
                                        .toString(),
                                  ),
                                  Row(
                                    children: [
                                      SingleInformation(
                                        title: 'Exam result',
                                        data: args.treatmentHistory.exams[index]
                                            .description
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  args.treatmentHistory.exams[index].diagnosis
                                          .isEmpty
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
                                              data: args
                                                  .treatmentHistory
                                                  .exams[index]
                                                  .diagnosis[0]
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
                Heading(heading: 'Investigation History'),
                HealthblockCard(
                  child: args.treatmentHistory.investigations.isEmpty
                      ? NoData(
                          message: 'No recorded patient investigation data',
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              args.treatmentHistory.investigations.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Column(
                                children: [
                                  InformationRow(
                                    fTitle: 'Patient No',
                                    sTitle: 'Staff No',
                                    fData: args.treatmentHistory
                                        .investigations[index].patient
                                        .toString(),
                                    sData: args.treatmentHistory
                                        .investigations[index].doctor
                                        .toString(),
                                  ),
                                  InformationRow(
                                    fTitle: 'Date',
                                    sTitle: 'Requested investigation',
                                    fData: args.treatmentHistory
                                        .investigations[index].date
                                        .toString(),
                                    sData: args.treatmentHistory
                                        .investigations[index].title
                                        .toString(),
                                  ),
                                  Row(
                                    children: [
                                      SingleInformation(
                                        title: 'Investigation result',
                                        data: args.treatmentHistory
                                            .investigations[index].description
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
          ),
        ],
      ),
    );
  }
}
