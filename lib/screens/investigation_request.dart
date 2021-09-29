import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';
import 'package:healthblock/models/request_investigation_model.dart';
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

class InvestigationRequest extends StatefulWidget {
  static const String id = 'investigation_request';
  final int activePatient;
  const InvestigationRequest({Key key, this.activePatient}) : super(key: key);

  @override
  _InvestigationRequestState createState() => _InvestigationRequestState();
}

class _InvestigationRequestState extends State<InvestigationRequest> {
  String note;
  final _noteFieldController = TextEditingController();

  void _clearFields() {
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
                HeadNav(activePatient: patientNumber, activeScreen: 7),
                Heading(heading: 'Request Investigation'),
                HealthblockCard(
                  child: Column(
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
                                      hintText: "Investigation request note",
                                    ),
                                    onChanged: (value) => {
                                      note = value,
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
                                  if (note == null || note.isEmpty)
                                    {
                                      Utils.errorToast(
                                          'Investigation data can\'t be empty'),
                                    }
                                  else
                                    {
                                      _postRequestInvestigation(patientNumber),
                                    },
                                },
                                text: 'Request Investigation',
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

  _postRequestInvestigation(patient) async {
    int doctor = await LocalStorage.getStaffId();

    RequestInvestgationModel requestInvestgationModel =
        RequestInvestgationModel(
      patient: patient,
      staff: doctor,
      description: note,
    );

    var body = requestInvestgationModelToJson(requestInvestgationModel);

    Services.postRequestInvestigation(body)
        .then((value) => {
              _clearFields(),
              Utils.successToast('Request submitted'),
            })
        .catchError((onError) {
      Utils.errorToast('Unable to request investigation, try again please');
    });
  }
}
