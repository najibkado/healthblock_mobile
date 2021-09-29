import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';
import 'package:healthblock/models/finance_request_model.dart';
import 'package:healthblock/partials/body.dart';
import 'package:healthblock/partials/side_nav.dart';
import 'package:healthblock/partials/tile_item.dart';
import 'package:healthblock/partials/tile_title.dart';
import 'package:healthblock/screens/add_payment_record.dart';
import 'package:healthblock/screens/login.dart';
import 'package:healthblock/services/service.dart';
import 'package:healthblock/storage/local_storage.dart';
import 'package:healthblock/utils.dart';
import 'package:healthblock/widgets/heading.dart';
import 'package:healthblock/widgets/healthblock_card.dart';

class FinanceRequestList extends StatefulWidget {
  static const String id = 'finance_request_list';
  final List<FinanceRequestModel> activePayments;
  const FinanceRequestList({Key key, this.activePayments}) : super(key: key);

  @override
  _FinanceRequestListState createState() => _FinanceRequestListState();
}

class _FinanceRequestListState extends State<FinanceRequestList> {
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
    final activePayments = ModalRoute.of(context).settings.arguments as List;
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
                Heading(heading: 'Active Payment Requests'),
                HealthblockCard(
                  child: Column(
                    children: [
                      TileTitle(
                        fTitle: 'Patient No',
                        sTitle: 'Investigation ID',
                        tTitle: 'Payment Status',
                      ),
                      SizedBox(
                        height: 1110.0,
                        child: activePayments != null
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: activePayments.length,
                                itemBuilder: (context, index) {
                                  return TileItem(
                                    patientNo: activePayments[index]
                                        .patient
                                        .toString(),
                                    name: activePayments[index].id.toString(),
                                    status: activePayments[index].isPaid
                                        ? "Paid"
                                        : "Not paid",
                                    onPressed: () => {
                                      Navigator.pushNamed(
                                          context, AddPaymentRecord.id,
                                          arguments: activePayments[index])
                                    },
                                  );
                                },
                              )
                            : Container(
                                child: Center(
                                  child: Text(
                                    'Refresh please',
                                    style: kTitleTextDecoration,
                                  ),
                                ),
                              ),
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
