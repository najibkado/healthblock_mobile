import 'package:flutter/material.dart';
import 'package:healthblock/screens/add_lab_entry.dart';
import 'package:healthblock/screens/add_payment_record.dart';
import 'package:healthblock/screens/clinical_exam.dart';
import 'package:healthblock/screens/complaints.dart';
import 'package:healthblock/screens/finance_request_list.dart';
import 'package:healthblock/screens/home.dart';
import 'package:healthblock/screens/investigation_request.dart';
import 'package:healthblock/screens/lab_entry_patient_list.dart';
import 'package:healthblock/screens/login.dart';
import 'package:healthblock/screens/logs.dart';
import 'package:healthblock/screens/new_appointment.dart';
import 'package:healthblock/screens/new_appointment_success.dart';
import 'package:healthblock/screens/new_complaint.dart';
import 'package:healthblock/screens/new_patient.dart';
import 'package:healthblock/screens/new_treatment.dart';
import 'package:healthblock/screens/patient_report.dart';
import 'package:healthblock/screens/patient_report_search.dart';
import 'package:healthblock/screens/patient_summary.dart';
import 'package:healthblock/screens/patients.dart';
import 'package:healthblock/screens/patient_register_success.dart';
import 'package:healthblock/screens/staff_logs.dart';
import 'package:healthblock/screens/treatment_history.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // ignore: missing_return
      onGenerateRoute: (settings) {
        if (settings.name == PatientRegSuccess.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return PatientRegSuccess(patient: args);
            },
          );
        } else if (settings.name == AppointmentSuccess.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return AppointmentSuccess(appointment: args);
            },
          );
        } else if (settings.name == Patients.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return Patients(appointments: args);
            },
          );
        } else if (settings.name == Home.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return Home(summary: args);
            },
          );
        } else if (settings.name == PatientSummary.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return PatientSummary(patientInformation: args);
            },
          );
        } else if (settings.name == StaffLogs.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return StaffLogs(events: args);
            },
          );
        } else if (settings.name == PatientReportScreen.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return PatientReportScreen(patientReport: args);
            },
          );
        } else if (settings.name == NewComplaint.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return NewComplaint(activePatient: args);
            },
          );
        } else if (settings.name == Complaints.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return Complaints(args: args);
            },
          );
        } else if (settings.name == ClinicalExam.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return ClinicalExam(activePatient: args);
            },
          );
        } else if (settings.name == NewTreatment.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return NewTreatment(activePatient: args);
            },
          );
        } else if (settings.name == InvestigationRequest.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return InvestigationRequest(activePatient: args);
            },
          );
        } else if (settings.name == LabEntryPatientList.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return LabEntryPatientList(activeInvestigations: args);
            },
          );
        } else if (settings.name == AddLabEntry.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return AddLabEntry(investigationRequest: args);
            },
          );
        } else if (settings.name == FinanceRequestList.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return FinanceRequestList(activePayments: args);
            },
          );
        } else if (settings.name == AddPaymentRecord.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return AddPaymentRecord(activePatient: args);
            },
          );
        } else if (settings.name == TreatmentHistory.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return TreatmentHistory(args: args);
            },
          );
        }
      },
      initialRoute: Login.id,
      routes: {
        Login.id: (context) => Login(),
        Home.id: (context) => Home(),
        NewPatient.id: (context) => NewPatient(),
        NewAppointment.id: (context) => NewAppointment(),
        PatientRegSuccess.id: (context) => PatientRegSuccess(),
        AppointmentSuccess.id: (context) => AppointmentSuccess(),
        Patients.id: (context) => Patients(),
        PatientSummary.id: (context) => PatientSummary(),
        Logs.id: (context) => Logs(),
        StaffLogs.id: (context) => StaffLogs(),
        PatientReportSearch.id: (context) => PatientReportSearch(),
        PatientReportScreen.id: (context) => PatientReportScreen(),
        NewComplaint.id: (context) => NewComplaint(),
        Complaints.id: (context) => Complaints(),
        ClinicalExam.id: (context) => ClinicalExam(),
        NewTreatment.id: (context) => NewTreatment(),
        InvestigationRequest.id: (context) => InvestigationRequest(),
        LabEntryPatientList.id: (context) => LabEntryPatientList(),
        AddLabEntry.id: (context) => AddLabEntry(),
        FinanceRequestList.id: (context) => FinanceRequestList(),
        AddPaymentRecord.id: (context) => AddPaymentRecord(),
        TreatmentHistory.id: (context) => TreatmentHistory(),
      },
    );
  }
}
