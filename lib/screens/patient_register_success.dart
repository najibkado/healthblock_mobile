import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';
import 'package:healthblock/models/patient_model.dart';
import 'package:healthblock/partials/body.dart';
import 'package:healthblock/partials/side_nav.dart';
import 'package:healthblock/screens/home.dart';
import 'package:healthblock/screens/login.dart';
import 'package:healthblock/services/service.dart';
import 'package:healthblock/storage/local_storage.dart';
import 'package:healthblock/utils.dart';
import 'package:healthblock/widgets/button.dart';
import 'package:healthblock/widgets/heading.dart';
import 'package:healthblock/widgets/healthblock_card.dart';
import 'package:healthblock/widgets/information_row.dart';

// ignore: must_be_immutable
class PatientRegSuccess extends StatefulWidget {
  static const String id = 'patient_reg_success';

  Patient patient;

  PatientRegSuccess({this.patient});

  @override
  _PatientRegSuccessState createState() => _PatientRegSuccessState();
}

class _PatientRegSuccessState extends State<PatientRegSuccess> {
  String patientNo;
  String patientName;
  String age;
  String telephone;
  String address;
  String nextName;
  String nextRelationship;
  String nextAddress;
  String nextTelephone;
  bool status;

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
    final args = ModalRoute.of(context).settings.arguments as Patient;

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
          SideNav(
            activeScreen: 3,
          ),
          Body(
            child: Column(
              children: [
                Heading(heading: 'Patient registered successful'),
                HealthblockCard(
                  child: Column(
                    children: [
                      InformationRow(
                        fTitle: 'Patient Number',
                        sTitle: 'Patient Name',
                        fData: args.id.toString(),
                        sData: args.firstName,
                      ),
                      InformationRow(
                        fTitle: 'Age',
                        sTitle: 'Telephone',
                        fData: args.age,
                        sData: args.telephone,
                      ),
                      InformationRow(
                        fTitle: 'Address',
                        sTitle: 'Next of kin',
                        fData: args.address,
                        sData: args.nextOfKinFirstName,
                      ),
                      InformationRow(
                        fTitle: 'Relationship with next of kin',
                        sTitle: 'Next of kin address',
                        fData: args.nextOfKinRelationship,
                        sData: args.nextOfKinAddress,
                      ),
                      InformationRow(
                        fTitle: 'Next of kin telephone',
                        sTitle: 'Patient admission status',
                        fData: args.nextOfKinTelephone,
                        sData: args.status ? 'Admitted' : 'Not admitted',
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: PrimaryButton(
                                onPressed: () => {
                                  Services.summaryRequest().then(
                                    (value) => {
                                      Navigator.pushNamed(context, Home.id,
                                          arguments: value),
                                    },
                                  ),
                                },
                                text: 'Done',
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
}
