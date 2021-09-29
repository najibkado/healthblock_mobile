import 'package:flutter/material.dart';

class SideNavButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color background;

  const SideNavButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    @required this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50.0,
        width: double.infinity,
        color: background,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onTap: onPressed,
    );
  }
}
