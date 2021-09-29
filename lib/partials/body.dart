import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';

// ignore: must_be_immutable
class Body extends StatelessWidget {
  Widget child;

  Body({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Container(
        color: kBackgroundColor,
        child: child,
      ),
    );
  }
}
