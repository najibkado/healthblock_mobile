import 'package:flutter/material.dart';
import 'package:healthblock/widgets/single_text_information.dart';

// ignore: must_be_immutable
class InformationRow extends StatelessWidget {
  String fTitle;
  String sTitle;
  String fData;
  String sData;

  InformationRow({
    Key key,
    @required this.fTitle,
    @required this.sTitle,
    @required this.fData,
    @required this.sData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SingleInformation(
          title: fTitle,
          data: fData,
        ),
        SingleInformation(
          title: sTitle,
          data: sData,
        ),
      ],
    );
  }
}
