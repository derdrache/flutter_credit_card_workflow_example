import 'package:flutter/material.dart';

class CreditCardFront extends StatelessWidget {
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;

  const CreditCardFront({super.key, required this.cardNumber, required this.cardHolderName, required this.expiryDate});

  formateExpiryDate(expiryDate){
    if(expiryDate.length < 3) return expiryDate;

    return "${expiryDate.substring(0,2)}/${expiryDate.substring(2, expiryDate.length)}";
  }

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
          Positioned(top: 50, left: 28,child: Image.asset("assets/kredit Kart sim2.png")),
          Positioned(
              top: 100,
              left: 30,
              child: Text(
                cardNumber,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)),
          Positioned(
              bottom: 20,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Card Holder", style: TextStyle(color: Colors.white),),
                  Text(
                    cardHolderName,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                ],
              )),
          Positioned(
              bottom: 20,
              right: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Expires", style: TextStyle(color: Colors.white)),
                  Text(
                      formateExpiryDate(expiryDate),
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                ],
              )),
          const Positioned(
              top: 20,
              right: 30,
              child: Column(
                children: [
                  Text(
                    "VISA",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                ],
              )),
        ],
      ),
    );
  }
}


