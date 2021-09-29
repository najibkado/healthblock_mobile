import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';
import 'package:healthblock/partials/body.dart';
import 'package:healthblock/partials/side_nav.dart';
import 'package:healthblock/screens/login.dart';
import 'package:healthblock/screens/patient_report_search.dart';
import 'package:healthblock/screens/staff_logs.dart';
import 'package:healthblock/services/service.dart';
import 'package:healthblock/storage/local_storage.dart';
import 'package:healthblock/utils.dart';
import 'package:healthblock/widgets/heading.dart';
import 'package:healthblock/widgets/healthblock_card.dart';

class Logs extends StatefulWidget {
  static const String id = 'logs';
  const Logs({Key key}) : super(key: key);

  @override
  _LogsState createState() => _LogsState();
}

class _LogsState extends State<Logs> {
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
          SideNav(activeScreen: 6),
          Body(
            child: Column(
              children: [
                Heading(heading: 'Reports and Logs'),
                HealthblockCard(
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, PatientReportSearch.id);
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.supervisor_account,
                                color: kPrimaryColor,
                                size: 50.0,
                              ),
                              Text(
                                'Patient Report',
                                style: kTitleTextDecoration,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Click to view patient records \nNote: Use Computer to access more patient data',
                                style: kTextStyleDecoration,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      SizedBox(
                        height: 150.0,
                        child: Container(
                          width: 1.0,
                          color: kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Services.getEvents().then((value) => {
                                  Navigator.pushNamed(context, StaffLogs.id,
                                      arguments: value),
                                });
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.supervisor_account_outlined,
                                color: kPrimaryColor,
                                size: 50.0,
                              ),
                              Text(
                                'Staff Logs',
                                style: kTitleTextDecoration,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Click to view staff activities \nNote: Use Computer to access more staff log data',
                                style: kTextStyleDecoration,
                                textAlign: TextAlign.center,
                              ),
                            ],
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
