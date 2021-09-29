import 'package:healthblock/services/service.dart';

class PatientController {
  var patient;

  void setData(newPatient) async {
    final res = await Services.patientSetRequest(body: newPatient);

    if (res != null) {
      patient = res;
    }
  }
}
