import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xFFFCFDFF);
const kPrimaryColor = Color(0xFF3588FA);
const kSecondaryColor = Color(0xFF10386F);
const kAccentColor = Color(0xFF273952);

const kTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
  filled: true,
  fillColor: Colors.white,
  hintText: "Email",
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: kPrimaryColor, width: 0),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: kPrimaryColor, width: 0),
  ),
);

const kTitleTextDecoration = TextStyle(
  fontSize: 15.0,
  fontWeight: FontWeight.bold,
  color: kPrimaryColor,
);

const kTextStyleDecoration = TextStyle(
  fontSize: 15.0,
  fontWeight: FontWeight.bold,
  color: kAccentColor,
);

const kActiveHeadNavTitleDecoration = TextStyle(
  fontSize: 15.0,
  color: kPrimaryColor,
);

const kHeadNavTitleDecoration = TextStyle(
  fontSize: 15.0,
);
