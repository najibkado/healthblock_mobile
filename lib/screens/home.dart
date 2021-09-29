import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';
import 'package:healthblock/models/summary_model.dart';
import 'package:healthblock/partials/body.dart';
import 'package:healthblock/partials/side_nav.dart';
import 'package:healthblock/screens/login.dart';
import 'package:healthblock/services/service.dart';
import 'package:healthblock/storage/local_storage.dart';
import 'package:healthblock/utils.dart';
import 'package:healthblock/widgets/heading.dart';
import 'package:healthblock/widgets/healthblock_card.dart';
import 'package:healthblock/widgets/information_row.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  static const String id = 'home';
  final Summary summary;

  Home({this.summary});

  ///Correct API requests, It doesn't work as expected

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int id;
  String token;
  String username;
  bool isLoading = true;

  // SummaryController summaryController = SummaryController();

  @override
  void initState() {
    super.initState();
    this._getData();
  }

  void _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      id = prefs.getInt('userId');
      token = prefs.getString('token');
      username = prefs.getString('username');
    });
  }

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
    final args = ModalRoute.of(context).settings.arguments as Summary;

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
          SideNav(
            activeScreen: 1,
          ),
          Body(
            child: args != null
                ? Column(
                    children: [
                      Heading(heading: 'Summary'),
                      HealthblockCard(
                        flex: 1,
                        child: Column(
                          children: [
                            InformationRow(
                              fTitle: 'Name',
                              fData: args.name ?? ' ',
                              sTitle: 'Username',
                              sData: username ?? ' ',
                            ),
                            InformationRow(
                              fTitle: 'Department',
                              fData: args.department.name ?? ' ',
                              sTitle: 'Job',
                              sData: args.job ?? ' ',
                            ),
                          ],
                        ),
                      ),
                      Heading(
                        heading: 'Department',
                      ),
                      HealthblockCard(
                        flex: 2,
                        child: Column(
                          children: [
                            InformationRow(
                              fTitle: 'Name',
                              fData: args.department.name ?? ' ',
                              sTitle: 'Description',
                              sData: args.department.description ?? ' ',
                            ),
                          ],
                        ),
                      ),
                    ],
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
    );
  }
}
