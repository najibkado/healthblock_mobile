import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:healthblock/constants.dart';

class PrimaryButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;

  PrimaryButton({@required this.onPressed, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45.0,
      child: RawMaterialButton(
        fillColor: kPrimaryColor,
        splashColor: kSecondaryColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
        onPressed: onPressed,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
