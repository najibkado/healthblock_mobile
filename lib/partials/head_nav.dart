import 'package:flutter/material.dart';
import 'package:healthblock/arguments/treatment_history_arguments.dart';
import 'package:healthblock/constants.dart';
import 'package:healthblock/arguments/complaints_arguments.dart';
import 'package:healthblock/screens/clinical_exam.dart';
import 'package:healthblock/screens/complaints.dart';
import 'package:healthblock/screens/investigation_request.dart';
import 'package:healthblock/screens/new_complaint.dart';
import 'package:healthblock/screens/new_treatment.dart';
import 'package:healthblock/screens/patient_summary.dart';
import 'package:healthblock/screens/treatment_history.dart';
import 'package:healthblock/services/service.dart';

class HeadNav extends StatelessWidget {
  final int activeScreen;
  final int activePatient;

  HeadNav({
    Key key,
    @required this.activePatient,
    @required this.activeScreen,
  }) : super(key: key);

  // ignore: missing_return
  Widget getNav(context) {
    if (this.activeScreen == 1) {
      return Row(
        children: [
          GestureDetector(
            onTap: () {
              Services.getPatientInformation(activePatient).then(
                (value) => {
                  Navigator.pushNamed(context, PatientSummary.id,
                      arguments: value),
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Patient',
                style: kActiveHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, NewComplaint.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'New Complaint',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Services.getComplaints(activePatient).then((value) => {
                    Navigator.pushNamed(context, Complaints.id,
                        arguments: ComplaintsArguments(activePatient, value)),
                  });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Complaints',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ClinicalExam.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Clinical Exam',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, NewTreatment.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'New Treatment',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Services.getTreatments(activePatient).then((value) => {
                    Navigator.pushNamed(context, TreatmentHistory.id,
                        arguments:
                            TreatmentHistoryArguments(activePatient, value)),
                  });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Treatments',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, InvestigationRequest.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Investigation',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
        ],
      );
    } else if (this.activeScreen == 2) {
      return Row(
        children: [
          GestureDetector(
            onTap: () {
              Services.getPatientInformation(activePatient).then(
                (value) => {
                  Navigator.pushNamed(context, PatientSummary.id,
                      arguments: value),
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Patient',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, NewComplaint.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'New Complaint',
                style: kActiveHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Services.getComplaints(activePatient).then((value) => {
                    Navigator.pushNamed(context, Complaints.id,
                        arguments: ComplaintsArguments(activePatient, value)),
                  });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Complaints',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ClinicalExam.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Clinical Exam',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, NewTreatment.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'New Treatment',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Services.getTreatments(activePatient).then((value) => {
                    Navigator.pushNamed(context, TreatmentHistory.id,
                        arguments:
                            TreatmentHistoryArguments(activePatient, value)),
                  });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Treatments',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, InvestigationRequest.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Investigation',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
        ],
      );
    } else if (this.activeScreen == 3) {
      return Row(
        children: [
          GestureDetector(
            onTap: () {
              Services.getPatientInformation(activePatient).then(
                (value) => {
                  Navigator.pushNamed(context, PatientSummary.id,
                      arguments: value),
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Patient',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, NewComplaint.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'New Complaint',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Services.getComplaints(activePatient).then((value) => {
                    Navigator.pushNamed(context, Complaints.id,
                        arguments: ComplaintsArguments(activePatient, value)),
                  });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Complaints',
                style: kActiveHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ClinicalExam.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Clinical Exam',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, NewTreatment.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'New Treatment',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Services.getTreatments(activePatient).then((value) => {
                    Navigator.pushNamed(context, TreatmentHistory.id,
                        arguments:
                            TreatmentHistoryArguments(activePatient, value)),
                  });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Treatments',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, InvestigationRequest.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Investigation',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
        ],
      );
    } else if (this.activeScreen == 4) {
      return Row(
        children: [
          GestureDetector(
            onTap: () {
              Services.getPatientInformation(activePatient).then(
                (value) => {
                  Navigator.pushNamed(context, PatientSummary.id,
                      arguments: value),
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Patient',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, NewComplaint.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'New Complaint',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Services.getComplaints(activePatient).then((value) => {
                    Navigator.pushNamed(context, Complaints.id,
                        arguments: ComplaintsArguments(activePatient, value)),
                  });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Complaints',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ClinicalExam.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Clinical Exam',
                style: kActiveHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, NewTreatment.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'New Treatment',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Services.getTreatments(activePatient).then((value) => {
                    Navigator.pushNamed(context, TreatmentHistory.id,
                        arguments:
                            TreatmentHistoryArguments(activePatient, value)),
                  });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Treatments',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, InvestigationRequest.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Investigation',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
        ],
      );
    } else if (this.activeScreen == 5) {
      return Row(
        children: [
          GestureDetector(
            onTap: () {
              Services.getPatientInformation(activePatient).then(
                (value) => {
                  Navigator.pushNamed(context, PatientSummary.id,
                      arguments: value),
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Patient',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, NewComplaint.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'New Complaint',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Services.getComplaints(activePatient).then((value) => {
                    Navigator.pushNamed(context, Complaints.id,
                        arguments: ComplaintsArguments(activePatient, value)),
                  });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Complaints',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ClinicalExam.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Clinical Exam',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, NewTreatment.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'New Treatment',
                style: kActiveHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Services.getTreatments(activePatient).then((value) => {
                    Navigator.pushNamed(context, TreatmentHistory.id,
                        arguments:
                            TreatmentHistoryArguments(activePatient, value)),
                  });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Treatments',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, InvestigationRequest.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Investigation',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
        ],
      );
    } else if (this.activeScreen == 6) {
      return Row(
        children: [
          GestureDetector(
            onTap: () {
              Services.getPatientInformation(activePatient).then(
                (value) => {
                  Navigator.pushNamed(context, PatientSummary.id,
                      arguments: value),
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Patient',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, NewComplaint.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'New Complaint',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Services.getComplaints(activePatient).then((value) => {
                    Navigator.pushNamed(context, Complaints.id,
                        arguments: ComplaintsArguments(activePatient, value)),
                  });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Complaints',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ClinicalExam.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Clinical Exam',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, NewTreatment.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'New Treatment',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Services.getTreatments(activePatient).then((value) => {
                    Navigator.pushNamed(context, TreatmentHistory.id,
                        arguments:
                            TreatmentHistoryArguments(activePatient, value)),
                  });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Treatments',
                style: kActiveHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, InvestigationRequest.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Investigation',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
        ],
      );
    } else if (activeScreen == 7) {
      return Row(
        children: [
          GestureDetector(
            onTap: () {
              Services.getPatientInformation(activePatient).then(
                (value) => {
                  Navigator.pushNamed(context, PatientSummary.id,
                      arguments: value),
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Patient',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, NewComplaint.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'New Complaint',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Services.getComplaints(activePatient).then((value) => {
                    Navigator.pushNamed(context, Complaints.id,
                        arguments: ComplaintsArguments(activePatient, value)),
                  });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Complaints',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ClinicalExam.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Clinical Exam',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, NewTreatment.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'New Treatment',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Services.getTreatments(activePatient).then((value) => {
                    Navigator.pushNamed(context, TreatmentHistory.id,
                        arguments:
                            TreatmentHistoryArguments(activePatient, value)),
                  });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Treatments',
                style: kHeadNavTitleDecoration,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, InvestigationRequest.id,
                  arguments: activePatient);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Investigation',
                style: kActiveHeadNavTitleDecoration,
              ),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getNav(context),
      height: 50.0,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
