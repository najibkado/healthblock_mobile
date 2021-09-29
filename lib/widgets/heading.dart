import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';

// ignore: must_be_immutable
class Heading extends StatelessWidget {
  String heading;

  Heading({Key key, @required this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
      child: Text(
        heading,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: kAccentColor,
        ),
      ),
    );
  }
}
