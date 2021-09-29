import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';

class NoData extends StatelessWidget {
  final String message;
  const NoData({
    Key key,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          message,
          style: kTitleTextDecoration,
        ),
      ),
    );
  }
}
