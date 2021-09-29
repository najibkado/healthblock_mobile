import 'package:healthblock/models/treatment_history_model.dart';

class TreatmentHistoryArguments {
  final int activePatient;
  final TreatmentHistory treatmentHistory;

  TreatmentHistoryArguments(this.activePatient, this.treatmentHistory);
}
