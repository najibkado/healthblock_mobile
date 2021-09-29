import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';
import 'package:healthblock/partials/body.dart';
import 'package:healthblock/partials/head_nav.dart';
import 'package:healthblock/partials/side_nav.dart';
import 'package:healthblock/arguments/complaints_arguments.dart';
import 'package:healthblock/screens/login.dart';
import 'package:healthblock/services/service.dart';
import 'package:healthblock/storage/local_storage.dart';
import 'package:healthblock/utils.dart';
import 'package:healthblock/widgets/heading.dart';
import 'package:healthblock/widgets/healthblock_card.dart';
import 'package:healthblock/widgets/information_row.dart';
import 'package:healthblock/widgets/no_message.dart';
import 'package:healthblock/widgets/single_text_information.dart';

class Complaints extends StatefulWidget {
  static const String id = 'complaints';
  final ComplaintsArguments args;
  const Complaints({Key key, this.args}) : super(key: key);

  @override
  _ComplaintsState createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
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
        ModalRoute.of(context).settings.arguments as ComplaintsArguments;
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
                HeadNav(activePatient: args.activePatient, activeScreen: 3),
                Heading(heading: 'Complaint History'),
                HealthblockCard(
                  child: args.complaints.complaints.isEmpty
                      ? NoData(
                          message: 'No recorded patient complaints data',
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: args.complaints.complaints.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Column(
                                children: [
                                  InformationRow(
                                    fTitle: 'Patient No',
                                    sTitle: 'Doctor No',
                                    fData: args
                                        .complaints.complaints[index].patient
                                        .toString(),
                                    sData: args
                                        .complaints.complaints[index].doctor
                                        .toString(),
                                  ),
                                  InformationRow(
                                    fTitle: 'Date',
                                    sTitle: 'Title',
                                    fData: args
                                        .complaints.complaints[index].date
                                        .toString(),
                                    sData: args
                                        .complaints.complaints[index].title
                                        .toString(),
                                  ),
                                  Row(
                                    children: [
                                      SingleInformation(
                                        title: 'Complaint',
                                        data: args.complaints.complaints[index]
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
          ),
        ],
      ),
    );
  }
}
