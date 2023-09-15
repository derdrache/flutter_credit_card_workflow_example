import 'package:flutter/material.dart';

class CreditCardFront extends StatelessWidget {
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;

  const CreditCardFront({super.key, required this.cardNumber, required this.expiryDate, required this.cardHolderName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:20, bottom: 20, right: 30, left: 30),
      width: double.infinity,
      height: 200,
      child: Stack(children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Card(
            elevation: 12,
            color: Colors.blue,
          ),
        ),
        Positioned(top: 50, left: 28, child: Image.asset("assets/kredit Kart sim2.png")),
        Positioned(
          top: 100, left: 30,
          child: Text(cardNumber,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
        ),        Positioned(
          top: 100, right: 30,
          child: Text("VISA",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
        ),
        Positioned(bottom: 20, left: 30,child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("CARD HOLDER", style: TextStyle(color: Colors.white),),
            Text(cardHolderName,style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)
          ],
        ),),
        Positioned(bottom: 20, right: 30,child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("EXPIRES", style: TextStyle(color: Colors.white),),
            Text(expiryDate,style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)
          ],
        ),),
      ],),
    );
  }
}
