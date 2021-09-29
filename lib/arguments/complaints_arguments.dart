import 'package:healthblock/models/complaints_model.dart';

class ComplaintsArguments {
  final int activePatient;
  final Complaints complaints;

  ComplaintsArguments(this.activePatient, this.complaints);
}
