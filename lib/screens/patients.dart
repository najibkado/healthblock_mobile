import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';
import 'package:healthblock/models/appointment_info_model.dart';
import 'package:healthblock/partials/body.dart';
import 'package:healthblock/partials/side_nav.dart';
import 'package:healthblock/partials/tile_item.dart';
import 'package:healthblock/partials/tile_title.dart';
import 'package:healthblock/screens/login.dart';
import 'package:healthblock/screens/patient_summary.dart';
import 'package:healthblock/services/service.dart';
import 'package:healthblock/storage/local_storage.dart';
import 'package:healthblock/utils.dart';
import 'package:healthblock/widgets/heading.dart';
import 'package:healthblock/widgets/healthblock_card.dart';

class Patients extends StatefulWidget {
  static const String id = 'patients';
  final AppointmentInfo appointments;

  Patients({this.appointments});

  @override
  _PatientsState createState() => _PatientsState();
}

class _PatientsState extends State<Patients> {
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
    final args = ModalRoute.of(context).settings.arguments as AppointmentInfo;
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
                Heading(heading: 'Patients with appointment'),
                HealthblockCard(
                  child: Column(
                    children: [
                      TileTitle(
                        fTitle: 'Patient No',
                        sTitle: 'Patient Name',
                        tTitle: 'Admission Status',
                      ),
                      SizedBox(
                        height: 1110.0,
                        child: args != null
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: args.appoinmtents.length,
                                itemBuilder: (context, index) {
                                  return TileItem(
                                    patientNo:
                                        args.appoinmtents[index].id.toString(),
                                    name: args.appoinmtents[index].name,
                                    status: args.appoinmtents[index].status,
                                    onPressed: () => {
                                      Services.getPatientInformation(args
                                              .appoinmtents[index].id
                                              .toString())
                                          .then(
                                        (value) => {
                                          Navigator.pushNamed(
                                              context, PatientSummary.id,
                                              arguments: value),
                                        },
                                      ),
                                    },
                                  );
                                },
                              )
                            : Container(
                                child: Center(
                                  child: Text(
                                    'Refresh please',
                                    style: kTitleTextDecoration,
                                  ),
                                ),
                              ),
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
}
