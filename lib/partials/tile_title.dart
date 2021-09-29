import 'package:flutter/material.dart';
import 'package:healthblock/constants.dart';

class TileTitle extends StatelessWidget {
  final fTitle;
  final sTitle;
  final tTitle;
  const TileTitle({
    Key key,
    this.fTitle,
    this.sTitle,
    this.tTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              fTitle,
              style: kTitleTextDecoration,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              sTitle,
              style: kTitleTextDecoration,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              tTitle,
              style: kTitleTextDecoration,
            ),
          ),
        ],
      ),
    );
  }
}
