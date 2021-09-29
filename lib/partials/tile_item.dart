import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';

class TileItem extends StatelessWidget {
  final String patientNo;
  final String name;
  final String status;
  final Function onPressed;

  TileItem({
    Key key,
    this.onPressed,
    this.patientNo,
    this.name,
    this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50.0,
        padding: EdgeInsets.all(2.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                this.patientNo,
                style: kTextStyleDecoration,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                this.name,
                style: kTextStyleDecoration,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                status,
                style: kTextStyleDecoration,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
