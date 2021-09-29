import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';
import 'package:healthblock/models/appointment_model.dart';
import 'package:healthblock/partials/body.dart';
import 'package:healthblock/partials/side_nav.dart';
import 'package:healthblock/screens/login.dart';
import 'package:healthblock/screens/new_appointment.dart';
import 'package:healthblock/services/service.dart';
import 'package:healthblock/storage/local_storage.dart';
import 'package:healthblock/utils.dart';
import 'package:healthblock/widgets/button.dart';
import 'package:healthblock/widgets/heading.dart';
import 'package:healthblock/widgets/healthblock_card.dart';
import 'package:healthblock/widgets/single_text_information.dart';

// ignore: must_be_immutable
class AppointmentSuccess extends StatefulWidget {
  static const String id = 'appointment_success';
  Appointment appointment;

  AppointmentSuccess({this.appointment});

  @override
  _AppointmentSuccessState createState() => _AppointmentSuccessState();
}

class _AppointmentSuccessState extends State<AppointmentSuccess> {
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
    final args = ModalRoute.of(context).settings.arguments as Appointment;
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
            activeScreen: 4,
          ),
          Body(
            child: Column(
              children: [
                Heading(heading: 'Appointment successful'),
                HealthblockCard(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SingleInformation(
                              title: 'Success',
                              data: 'Booked for patient number ' +
                                  args.patient.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: PrimaryButton(
                                onPressed: () => {
                                  Navigator.pushNamed(
                                    context,
                                    NewAppointment.id,
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
