import 'package:flutter/material.dart';

class CreditCardBack extends StatelessWidget {
  final String controllNumber;

  const CreditCardBack({super.key, required this.controllNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      margin: EdgeInsets.only(top: 20, bottom: 20, right: 30, left: 30),
      child: Stack(children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Card(
            elevation: 12,
            color: Colors.blue,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 20),
          color: Colors.black,
          height: 50,
          width: double.infinity,
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 80, top: 90),
          color: Colors.white,
          height: 40,
          width: double.infinity,
        ),
        Positioned(top: 100, right: 90, child: Text(controllNumber))
      ],),
    );
  }
}
