import 'dart:convert';
import 'package:healthblock/models/active_investigations_model.dart';
import 'package:healthblock/models/appointment_info_model.dart';
import 'package:healthblock/models/appointment_model.dart';
import 'package:healthblock/models/complaints_model.dart';
import 'package:healthblock/models/event_model.dart';
import 'package:healthblock/models/finance_request_model.dart';
import 'package:healthblock/models/login_model.dart';
import 'package:healthblock/models/patient_information_model.dart';
import 'package:healthblock/models/patient_model.dart';
import 'package:healthblock/models/patient_report_model.dart';
import 'package:healthblock/models/payment_model.dart';
import 'package:healthblock/models/request_investigation_model.dart';
import 'package:healthblock/models/summary_model.dart';
import 'package:healthblock/models/treatment_history_model.dart';
import 'package:healthblock/storage/local_storage.dart';
import 'package:http/http.dart' as http;

class Services {
  static const String url = 'http://10.0.2.2:8000/api/';
  static const String login = 'accounts/login/';
  static const String logout = 'accounts/logout/';
  static const String summary = 'summary';
  static const String patient = 'patients';
  static const String patientInfo = 'patients/information/';
  static const String appointment = 'appointment';
  static const String appointmentInfo = 'appointment/information';
  static const String event = 'staff/events';
  static const String patientReport = 'patients/reports/';
  static const String addData = 'add_data';
  static const String requestInvestigation = 'patients/investigation';
  static const String finance = 'patients/finance';

  static String token;
  static var headers;

  static void _headers() {
    LocalStorage.getToken().then((value) => {
          token = value,
        });

    headers = {
      "Content-Type": "application/json",
      "Authorization": "Token " + token
    };
  }

  static Future updateAppointment(appointmentId) async {
    String appointmentUpdate = 'appointment/update/$appointmentId';
    try {
      var appointmentUpdateUrl = Uri.parse(url + appointmentUpdate);
      _headers();
      var response = await http.get(appointmentUpdateUrl, headers: headers);
      if (response.statusCode == 200) {
        return jsonDecode(response.body).toString();
      } else {
        print(response.statusCode);
        print(response.body);
        throw (response.body);
      }
    } catch (e) {
      throw (e);
    }
  }

  static Future getTreatments(patientId) async {
    String treatment = 'patients/$patientId/treatments';
    try {
      var treatmentUrl = Uri.parse(url + treatment);
      _headers();
      var response = await http.get(treatmentUrl, headers: headers);
      if (response.statusCode == 200) {
        return treatmentHistoryFromJson(response.body);
      } else {
        print(response.statusCode);
        print(response.body);
        throw (response.body);
      }
    } catch (e) {
      throw (e);
    }
  }

  static Future getComplaints(patientId) async {
    String complaint = 'patients/$patientId/complaints';
    try {
      var complaintUrl = Uri.parse(url + complaint);
      _headers();
      var response = await http.get(complaintUrl, headers: headers);
      if (response.statusCode == 200) {
        return complaintsFromJson(response.body);
      } else {
        print(response.statusCode);
        print(response.body);
        throw (response.body);
      }
    } catch (e) {
      throw (e);
    }
  }

  static Future setActivePayments(body) async {
    try {
      var requestInvestigationUrl = Uri.parse(url + finance);
      body = jsonEncode(body);
      var acceptedBody = jsonDecode(body);
      var response = await http.post(requestInvestigationUrl,
          headers: headers, body: acceptedBody);
      if (response.statusCode == 201) {
        return paymentFromJson(response.body);
      } else {
        print(response.statusCode);
        print(response.body);
        throw (response.body);
      }
    } catch (e) {
      throw (e);
    }
  }

  static Future getActivePayments() async {
    try {
      var requestInvestigationUrl = Uri.parse(url + finance);
      var response = await http.get(requestInvestigationUrl, headers: headers);
      if (response.statusCode == 200) {
        return financeRequestModelFromJson(response.body);
      } else {
        print(response.statusCode);
        print(response.body);
        throw (response.body);
      }
    } catch (e) {
      throw (e);
    }
  }

  static Future getActiveInvestigations() async {
    try {
      var requestInvestigationUrl = Uri.parse(url + requestInvestigation);
      var response = await http.get(requestInvestigationUrl, headers: headers);
      if (response.statusCode == 200) {
        return activeInvestigationsFromJson(response.body);
      } else {
        print(response.statusCode);
        print(response.body);
        throw (response.body);
      }
    } catch (e) {
      throw (e);
    }
  }

  static Future postRequestInvestigation(body) async {
    try {
      var requestInvestigationUrl = Uri.parse(url + requestInvestigation);
      body = jsonEncode(body);
      var acceptedBody = jsonDecode(body);
      _headers();
      var response = await http.post(requestInvestigationUrl,
          body: acceptedBody, headers: headers);
      if (response.statusCode == 201) {
        return requestInvestgationModelFromJson(response.body);
      } else {
        print(response.statusCode);
        print(response.body);
        throw (response.body);
      }
    } catch (e) {
      throw (e);
    }
  }

  static Future addBlockData(body) async {
    try {
      var addDataUrl = Uri.parse(url + addData);
      body = jsonEncode(body);
      var acceptedBody = jsonDecode(body);
      _headers();
      var response =
          await http.post(addDataUrl, body: acceptedBody, headers: headers);
      if (response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        print(response.statusCode);
        print(response.body);
        throw (response.body);
      }
    } catch (e) {
      throw (e);
    }
  }

  static Future getPatientReport(id) async {
    try {
      var patientReportUrl = Uri.parse(url + patientReport + id);
      _headers();
      var response = await http.get(patientReportUrl, headers: headers);
      if (response.statusCode == 200) {
        return patientReportFromJson(response.body);
      } else {
        print(response.statusCode);
        print(response.body);
        throw (response.body);
      }
    } catch (e) {
      throw (e);
    }
  }

  static Future getEvents() async {
    try {
      var eventUrl = Uri.parse(url + event);
      _headers();
      var response = await http.get(eventUrl, headers: headers);
      if (response.statusCode == 200) {
        return eventsFromJson(response.body);
      } else {
        print(response.statusCode);
        print(response.body);
        throw (response.body);
      }
    } catch (e) {
      throw (e);
    }
  }

  static Future getAppointmentInfo() async {
    try {
      var appointmentInfoUrl = Uri.parse(url + appointmentInfo);
      _headers();
      var response = await http.get(appointmentInfoUrl, headers: headers);
      if (response.statusCode == 200) {
        return appointmentInfoFromJson(response.body);
      } else {
        print(response.statusCode);
        print(response.body);
        throw (response.body);
      }
    } catch (e) {
      throw (e);
    }
  }

  static Future setAppointment({body}) async {
    try {
      var appointmentUrl = Uri.parse(url + appointment);
      _headers();
      body = jsonEncode(body);
      var acceptedBody = jsonDecode(body);
      var response =
          await http.post(appointmentUrl, body: acceptedBody, headers: headers);
      if (response.statusCode == 201) {
        return appointmentFromJson(response.body);
      } else {
        print(response.statusCode);
        print(response.body);
        throw (response.body);
      }
    } catch (e) {
      throw (e);
    }
  }

  static Future getPatientInformation(id) async {
    try {
      var patientInfoUrl = Uri.parse(url + patientInfo + id.toString());
      _headers();
      var response = await http.get(patientInfoUrl, headers: headers);

      if (response.statusCode == 200) {
        return patientInformationFromJson(response.body);
      } else {
        print(response.statusCode);
        print(response.body);
        throw (response.body);
      }
    } catch (e) {
      throw (e);
    }
  }

  static Future patientSetRequest({body}) async {
    try {
      var patientUrl = Uri.parse(url + patient);
      _headers();
      body = jsonEncode(body);
      var acceptedBody = jsonDecode(body);
      var response =
          await http.post(patientUrl, body: acceptedBody, headers: headers);
      if (response.statusCode == 201) {
        return patientFromJson(response.body);
      } else {
        print(response.statusCode);
        print(response.body);
        throw (response.body);
      }
    } catch (e) {
      throw (e);
    }
  }

  // ignore: missing_return
  static Future<Summary> summaryRequest() async {
    try {
      var summaryUrl = Uri.parse(url + summary);
      _headers();
      var response = await http.get(summaryUrl, headers: headers);
      if (response.statusCode == 200) {
        Summary userSummary = summaryFromJson(response.body);
        return userSummary;
      } else {
        throw ('Unable to get summary');
      }
    } catch (e) {
      print(e.toString());
      throw ('Unable to get summary data');
    }
  }

  static Future<Staff> loginRequest(username, password) async {
    try {
      var loginUrl = Uri.parse(url + login);
      var response = await http
          .post(loginUrl, body: {'username': username, 'password': password});
      print(response.statusCode);
      if (response.statusCode == 200) {
        Staff user = staffFromJson(response.body);
        return user;
      } else {
        throw ('invalid user credentials');
      }
    } catch (e) {
      print(e.toString());
      throw ('invalid user credentials');
    }
  }

  static Future<bool> logoutRequest() async {
    try {
      var logoutUrl = Uri.parse(url + logout);
      _headers();
      var response = await http.get(logoutUrl, headers: headers);
      if (response.statusCode == 401) {
        print('Logged out successfully');
        return true;
      } else {
        throw ('Unable to logout at the moment');
      }
    } catch (e) {
      throw ('Unable to logout at the moment');
    }
  }
}
