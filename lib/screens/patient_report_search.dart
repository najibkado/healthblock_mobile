import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';
import 'package:healthblock/partials/body.dart';
import 'package:healthblock/partials/side_nav.dart';
import 'package:healthblock/partials/tile_item.dart';
import 'package:healthblock/partials/tile_title.dart';
import 'package:healthblock/screens/login.dart';
import 'package:healthblock/screens/patient_report.dart';
import 'package:healthblock/services/service.dart';
import 'package:healthblock/storage/local_storage.dart';
import 'package:healthblock/utils.dart';
import 'package:healthblock/widgets/heading.dart';
import 'package:healthblock/widgets/healthblock_card.dart';

class PatientReportSearch extends StatefulWidget {
  static const String id = 'patient_report_search';
  const PatientReportSearch({Key key}) : super(key: key);

  @override
  _PatientReportSearchState createState() => _PatientReportSearchState();
}

class _PatientReportSearchState extends State<PatientReportSearch> {
  String patientNo;
  var data;
  void _logout() {
    Services.logoutRequest()
        .then(
      (value) => {
        LocalStorage.clearData(),
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Logout'))),
        Navigator.pushNamed(context, Login.id),
      },
    )
        .catchError(
      (onError) {
        Utils.errorToast('Unable to logout, try again');
      },
    );
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
          SideNav(activeScreen: 6),
          Body(
            child: Column(
              children: [
                Heading(heading: 'Generate patient report'),
                HealthblockCard(
                  child: Column(
                    children: [
                      TextField(
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Patient hospital no',
                          icon: Icon(Icons.search),
                        ),
                        onChanged: (value) {
                          patientNo = value;
                          if (patientNo.isEmpty) {
                            setState(() {
                              data = null;
                            });
                          } else {
                            getPatientReport(patientNo);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                data == null
                    ? Container()
                    : HealthblockCard(
                        child: Column(
                          children: [
                            TileTitle(
                              fTitle: 'Patient No',
                              sTitle: 'Patient Name',
                              tTitle: 'Admission Status',
                            ),
                            TileItem(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, PatientReportScreen.id,
                                    arguments: data);
                              },
                              patientNo: data.patient.id.toString(),
                              name: data.patient.name,
                              status: data.patient.status,
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

  getPatientReport(id) {
    Services.getPatientReport(id)
        .then((value) => {
              setState(() {
                data = value;
              }),
            })
        .catchError((onError) {
      setState(() {
        data = null;
      });
    });
  }
}
