import 'package:flutter/material.dart';

class HealthblockCard extends StatelessWidget {
  final int flex;
  final Widget child;

  const HealthblockCard({
    Key key,
    this.flex,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
        width: double.infinity,
        child: child,
        margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 30.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}
