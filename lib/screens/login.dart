import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';
import 'package:healthblock/screens/home.dart';
import 'package:healthblock/services/service.dart';
import 'package:healthblock/storage/local_storage.dart';
import 'package:healthblock/utils.dart';
import 'package:healthblock/widgets/button.dart';
import '../models/login_model.dart';

class Login extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _username;
  String _password;

  @override
  void initState() {
    LocalStorage.isLoggedIn().then((value) => {
          if (value == true)
            {
              Navigator.pushNamed(context, Home.id),
            }
        });
    super.initState();
  }

  void _login(username, password) async {
    Services.loginRequest(username, password)
        .then((Staff user) => {
              LocalStorage.storeUser(user),
              Services.summaryRequest().then(
                (value) => {
                  Navigator.pushNamed(context, Home.id, arguments: value),
                },
              ),
            })
        .catchError((onError) {
      Utils.errorToast("Invalid user credentials");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: kBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(0.0, 240.0, 25.0, 0.0),
                  child: Center(
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.fromLTRB(300.0, 0.0, 300.0, 300.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: "Username",
                        ),
                        onChanged: (value) => {_username = value},
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: "Password",
                        ),
                        onChanged: (value) => {_password = value},
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      PrimaryButton(
                        onPressed: () => {
                          if (_username?.isEmpty ?? true)
                            {
                              Utils.errorToast(
                                  "Please enter your valid credentials"),
                            }
                          else if (_password?.isEmpty ?? true)
                            {
                              Utils.errorToast(
                                  "Please enter your valid credentials"),
                            }
                          else if (_username.length < 4 || _password.length < 4)
                            {
                              Utils.errorToast(
                                  "Please enter your valid credentials"),
                            }
                          else
                            {
                              _login(_username, _password),
                            }
                        },
                        text: "Login",
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        'Forgotten your password? Contact IT ',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
