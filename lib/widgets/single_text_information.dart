import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';

// ignore: must_be_immutable
class SingleInformation extends StatelessWidget {
  String title;
  String data;

  SingleInformation({
    Key key,
    @required this.title,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            style: kTitleTextDecoration,
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
            child: Text(
              data,
              textAlign: TextAlign.start,
              style: kTextStyleDecoration,
            ),
          ),
        ],
      ),
    );
  }
}
