import 'package:flutter/material.dart';

class CreditCardBack extends StatelessWidget {
  final String controllNumber;

  const CreditCardBack({super.key, required this.controllNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
      width: double.infinity,
      height: 200,
      child: Stack(
        children: [
          const SizedBox(
            width: double.infinity,
            height: 200,
            child: Card(
              elevation: 12,
              color: Colors.blue,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5, top: 20),
            width: double.infinity,
            height: 50,
            color: Colors.black,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 80, top: 90),
            width: double.infinity,
            height: 40,
            color: Colors.white,
          ),
          Positioned(
            top: 100,
              right: 90,
              child: Text(controllNumber)
          )
        ],
      ),
    );
  }
}