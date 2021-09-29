import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';
import 'package:healthblock/models/event_model.dart';
import 'package:healthblock/partials/body.dart';
import 'package:healthblock/partials/side_nav.dart';
import 'package:healthblock/partials/tile_item.dart';
import 'package:healthblock/partials/tile_title.dart';
import 'package:healthblock/screens/login.dart';
import 'package:healthblock/services/service.dart';
import 'package:healthblock/storage/local_storage.dart';
import 'package:healthblock/utils.dart';
import 'package:healthblock/widgets/heading.dart';
import 'package:healthblock/widgets/healthblock_card.dart';

class StaffLogs extends StatefulWidget {
  static const String id = 'staff_logs';
  final Events events;
  StaffLogs({Key key, this.events}) : super(key: key);

  @override
  _StaffLogsState createState() => _StaffLogsState();
}

class _StaffLogsState extends State<StaffLogs> {
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
    final args = ModalRoute.of(context).settings.arguments as Events;
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
          SideNav(activeScreen: 6),
          Body(
            child: Column(
              children: [
                Heading(heading: 'Staff Logs'),
                HealthblockCard(
                  child: Column(
                    children: [
                      TileTitle(
                        fTitle: 'Staff',
                        sTitle: 'Action',
                        tTitle: 'Date & Time',
                      ),
                      SizedBox(
                        height: 1110.0,
                        child: args != null
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: args.events.length,
                                itemBuilder: (context, index) {
                                  return TileItem(
                                    patientNo: args.events[index].staff,
                                    name: args.events[index].action,
                                    status: args.events[index].date,
                                    onPressed: () => {},
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
