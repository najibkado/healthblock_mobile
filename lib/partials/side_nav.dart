import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';
import 'package:healthblock/screens/finance_request_list.dart';
import 'package:healthblock/screens/home.dart';
import 'package:healthblock/screens/lab_entry_patient_list.dart';
import 'package:healthblock/screens/logs.dart';
import 'package:healthblock/screens/new_appointment.dart';
import 'package:healthblock/screens/new_patient.dart';
import 'package:healthblock/screens/patients.dart';
import 'package:healthblock/services/service.dart';
import 'package:healthblock/widgets/side_nav_button.dart';

class SideNav extends StatelessWidget {
  final int activeScreen;

  /// 1 = Summary screen
  /// 2 = Patients screen
  /// 3 = New Patient screen
  /// 4 = New Appointment screen
  /// 5 = Lab entry screen
  /// 6 = Logs screen

  const SideNav({
    Key key,
    @required this.activeScreen,
  }) : super(key: key);

  // ignore: missing_return
  Widget getSideNav(context) {
    if (activeScreen == 1) {
      return Column(
        children: [
          SideNavButton(
            text: 'Summary',
            background: kSecondaryColor,
            onPressed: () => {
              Services.summaryRequest().then(
                (value) => {
                  Navigator.pushNamed(context, Home.id, arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'Patients',
            background: kAccentColor,
            onPressed: () => {
              Services.getAppointmentInfo().then(
                (value) => {
                  Navigator.pushNamed(context, Patients.id, arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'New Patient',
            background: kAccentColor,
            onPressed: () => {
              Navigator.pushNamed(context, NewPatient.id),
            },
          ),
          SideNavButton(
            text: 'New Appointment',
            background: kAccentColor,
            onPressed: () => {
              Navigator.pushNamed(context, NewAppointment.id),
            },
          ),
          SideNavButton(
            text: 'Lab Entry',
            background: kAccentColor,
            onPressed: () => {
              Services.getActiveInvestigations().then(
                (value) => {
                  Navigator.pushNamed(context, LabEntryPatientList.id,
                      arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'Finance',
            background: kAccentColor,
            onPressed: () => {
              Services.getActivePayments().then(
                (value) => {
                  Navigator.pushNamed(context, FinanceRequestList.id,
                      arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'Reports and Logs',
            background: kAccentColor,
            onPressed: () => {
              Navigator.pushNamed(context, Logs.id),
            },
          ),
        ],
      );
    } else if (activeScreen == 2) {
      return Column(
        children: [
          SideNavButton(
            text: 'Summary',
            background: kAccentColor,
            onPressed: () => {
              Services.summaryRequest().then(
                (value) => {
                  Navigator.pushNamed(context, Home.id, arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'Patients',
            background: kSecondaryColor,
            onPressed: () => {
              Services.getAppointmentInfo().then(
                (value) => {
                  Navigator.pushNamed(context, Patients.id, arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'New Patient',
            background: kAccentColor,
            onPressed: () => {
              Navigator.pushNamed(context, NewPatient.id),
            },
          ),
          SideNavButton(
            text: 'New Appointment',
            background: kAccentColor,
            onPressed: () => {
              Navigator.pushNamed(context, NewAppointment.id),
            },
          ),
          SideNavButton(
            text: 'Lab Entry',
            background: kAccentColor,
            onPressed: () => {
              Services.getActiveInvestigations().then(
                (value) => {
                  Navigator.pushNamed(context, LabEntryPatientList.id,
                      arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'Finance',
            background: kAccentColor,
            onPressed: () => {
              Services.getActivePayments().then(
                (value) => {
                  Navigator.pushNamed(context, FinanceRequestList.id,
                      arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'Reports and Logs',
            background: kAccentColor,
            onPressed: () => {
              Navigator.pushNamed(context, Logs.id),
            },
          ),
        ],
      );
    } else if (activeScreen == 3) {
      return Column(
        children: [
          SideNavButton(
            text: 'Summary',
            background: kAccentColor,
            onPressed: () => {
              Services.summaryRequest().then(
                (value) => {
                  Navigator.pushNamed(context, Home.id, arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'Patients',
            background: kAccentColor,
            onPressed: () => {
              Services.getAppointmentInfo().then(
                (value) => {
                  Navigator.pushNamed(context, Patients.id, arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'New Patient',
            background: kSecondaryColor,
            onPressed: () => {
              Navigator.pushNamed(context, NewPatient.id),
            },
          ),
          SideNavButton(
            text: 'New Appointment',
            background: kAccentColor,
            onPressed: () => {
              Navigator.pushNamed(context, NewAppointment.id),
            },
          ),
          SideNavButton(
            text: 'Lab Entry',
            background: kAccentColor,
            onPressed: () => {
              Services.getActiveInvestigations().then(
                (value) => {
                  Navigator.pushNamed(context, LabEntryPatientList.id,
                      arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'Finance',
            background: kAccentColor,
            onPressed: () => {
              Services.getActivePayments().then(
                (value) => {
                  Navigator.pushNamed(context, FinanceRequestList.id,
                      arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'Reports and Logs',
            background: kAccentColor,
            onPressed: () => {
              Navigator.pushNamed(context, Logs.id),
            },
          ),
        ],
      );
    } else if (activeScreen == 4) {
      return Column(
        children: [
          SideNavButton(
            text: 'Summary',
            background: kAccentColor,
            onPressed: () => {
              Services.summaryRequest().then(
                (value) => {
                  Navigator.pushNamed(context, Home.id, arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'Patients',
            background: kAccentColor,
            onPressed: () => {
              Services.getAppointmentInfo().then(
                (value) => {
                  Navigator.pushNamed(context, Patients.id, arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'New Patient',
            background: kAccentColor,
            onPressed: () => {
              Navigator.pushNamed(context, NewPatient.id),
            },
          ),
          SideNavButton(
            text: 'New Appointment',
            background: kSecondaryColor,
            onPressed: () => {
              Navigator.pushNamed(context, NewAppointment.id),
            },
          ),
          SideNavButton(
            text: 'Lab Entry',
            background: kAccentColor,
            onPressed: () => {
              Services.getActiveInvestigations().then(
                (value) => {
                  Navigator.pushNamed(context, LabEntryPatientList.id,
                      arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'Finance',
            background: kAccentColor,
            onPressed: () => {
              Services.getActivePayments().then(
                (value) => {
                  Navigator.pushNamed(context, FinanceRequestList.id,
                      arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'Reports and Logs',
            background: kAccentColor,
            onPressed: () => {
              Navigator.pushNamed(context, Logs.id),
            },
          ),
        ],
      );
    } else if (activeScreen == 5) {
      return Column(
        children: [
          SideNavButton(
            text: 'Summary',
            background: kAccentColor,
            onPressed: () => {
              Services.summaryRequest().then(
                (value) => {
                  Navigator.pushNamed(context, Home.id, arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'Patients',
            background: kAccentColor,
            onPressed: () => {
              Services.getAppointmentInfo().then(
                (value) => {
                  Navigator.pushNamed(context, Patients.id, arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'New Patient',
            background: kAccentColor,
            onPressed: () => {
              Navigator.pushNamed(context, NewPatient.id),
            },
          ),
          SideNavButton(
            text: 'New Appointment',
            background: kAccentColor,
            onPressed: () => {
              Navigator.pushNamed(context, NewAppointment.id),
            },
          ),
          SideNavButton(
            text: 'Lab Entry',
            background: kSecondaryColor,
            onPressed: () => {
              Services.getActiveInvestigations().then(
                (value) => {
                  Navigator.pushNamed(context, LabEntryPatientList.id,
                      arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'Finance',
            background: kAccentColor,
            onPressed: () => {
              Services.getActivePayments().then(
                (value) => {
                  Navigator.pushNamed(context, FinanceRequestList.id,
                      arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'Reports and Logs',
            background: kAccentColor,
            onPressed: () => {
              Navigator.pushNamed(context, Logs.id),
            },
          ),
        ],
      );
    } else if (activeScreen == 6) {
      return Column(
        children: [
          SideNavButton(
            text: 'Summary',
            background: kAccentColor,
            onPressed: () => {
              Services.summaryRequest().then(
                (value) => {
                  Navigator.pushNamed(context, Home.id, arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'Patients',
            background: kAccentColor,
            onPressed: () => {
              Services.getAppointmentInfo().then(
                (value) => {
                  Navigator.pushNamed(context, Patients.id, arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'New Patient',
            background: kAccentColor,
            onPressed: () => {
              Navigator.pushNamed(context, NewPatient.id),
            },
          ),
          SideNavButton(
            text: 'New Appointment',
            background: kAccentColor,
            onPressed: () => {
              Navigator.pushNamed(context, NewAppointment.id),
            },
          ),
          SideNavButton(
            text: 'Lab Entry',
            background: kAccentColor,
            onPressed: () => {
              Services.getActiveInvestigations().then(
                (value) => {
                  Navigator.pushNamed(context, LabEntryPatientList.id,
                      arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'Finance',
            background: kAccentColor,
            onPressed: () => {
              Services.getActivePayments().then(
                (value) => {
                  Navigator.pushNamed(context, FinanceRequestList.id,
                      arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'Reports and Logs',
            background: kSecondaryColor,
            onPressed: () => {
              Navigator.pushNamed(context, Logs.id),
            },
          ),
        ],
      );
    } else if (activeScreen == 7) {
      return Column(
        children: [
          SideNavButton(
            text: 'Summary',
            background: kAccentColor,
            onPressed: () => {
              Services.summaryRequest().then(
                (value) => {
                  Navigator.pushNamed(context, Home.id, arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'Patients',
            background: kAccentColor,
            onPressed: () => {
              Services.getAppointmentInfo().then(
                (value) => {
                  Navigator.pushNamed(context, Patients.id, arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'New Patient',
            background: kAccentColor,
            onPressed: () => {
              Navigator.pushNamed(context, NewPatient.id),
            },
          ),
          SideNavButton(
            text: 'New Appointment',
            background: kAccentColor,
            onPressed: () => {
              Navigator.pushNamed(context, NewAppointment.id),
            },
          ),
          SideNavButton(
            text: 'Lab Entry',
            background: kAccentColor,
            onPressed: () => {
              Services.getActiveInvestigations().then(
                (value) => {
                  Navigator.pushNamed(context, LabEntryPatientList.id,
                      arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'Finance',
            background: kSecondaryColor,
            onPressed: () => {
              Services.getActivePayments().then(
                (value) => {
                  Navigator.pushNamed(context, FinanceRequestList.id,
                      arguments: value),
                },
              ),
            },
          ),
          SideNavButton(
            text: 'Reports and Logs',
            background: kAccentColor,
            onPressed: () => {
              Navigator.pushNamed(context, Logs.id),
            },
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        color: kAccentColor,
        child: getSideNav(context),
      ),
    );
  }
}
