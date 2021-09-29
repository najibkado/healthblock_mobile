import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';
import 'package:healthblock/models/finance_request_model.dart';
import 'package:healthblock/models/payment_model.dart';
import 'package:healthblock/partials/body.dart';
import 'package:healthblock/partials/side_nav.dart';
import 'package:healthblock/screens/finance_request_list.dart';
import 'package:healthblock/screens/login.dart';
import 'package:healthblock/services/service.dart';
import 'package:healthblock/storage/local_storage.dart';
import 'package:healthblock/utils.dart';
import 'package:healthblock/widgets/button.dart';
import 'package:healthblock/widgets/heading.dart';
import 'package:healthblock/widgets/healthblock_card.dart';
import 'package:healthblock/widgets/information_row.dart';

class AddPaymentRecord extends StatefulWidget {
  static const String id = 'add_payment_record';
  final activePatient;
  const AddPaymentRecord({Key key, this.activePatient}) : super(key: key);

  @override
  _AddPaymentRecordState createState() => _AddPaymentRecordState();
}

class _AddPaymentRecordState extends State<AddPaymentRecord> {
  String amountPaid;
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
    final activePayments =
        ModalRoute.of(context).settings.arguments as FinanceRequestModel;
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
          SideNav(activeScreen: 7),
          Body(
            child: Column(
              children: [
                Heading(heading: 'Payment Request For'),
                HealthblockCard(
                  child: Column(
                    children: [
                      InformationRow(
                        fTitle: 'Patient No',
                        sTitle: 'Investigation ID',
                        fData: activePayments.patient.toString(),
                        sData: activePayments.id.toString(),
                      ),
                    ],
                  ),
                ),
                Heading(heading: 'Record Payment'),
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
                                    'Amount',
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
                                    decoration: kTextFieldDecoration.copyWith(
                                      hintText: "Amount paid",
                                    ),
                                    onChanged: (value) => {
                                      amountPaid = value,
                                    },
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
                                  if (amountPaid == null || amountPaid.isEmpty)
                                    {
                                      Utils.errorToast(
                                          'Amount can\'t be empty'),
                                    }
                                  else
                                    {
                                      _makePayment(activePayments),
                                    }
                                },
                                text: 'Pay',
                              ),
                            ),
                          ),
                          Expanded(child: Container())
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _makePayment(activePayment) {
    Payment payment = Payment(
      patient: activePayment.patient,
      investigation: activePayment.id,
      amountPaid: amountPaid,
    );
    var body = paymentToJson(payment);

    Services.setActivePayments(body)
        .then((value) => {
              Utils.successToast('Payment recorded successfully'),
              Services.getActivePayments().then(
                (value) => {
                  Navigator.pushNamed(context, FinanceRequestList.id,
                      arguments: value),
                },
              ),
            })
        .catchError((onError) {
      Utils.errorToast('Unable to record payment, try again');
    });
  }
}
