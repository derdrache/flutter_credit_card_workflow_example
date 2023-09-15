import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardInput extends StatelessWidget {
  final TextEditingController cardNumberController;
  final TextEditingController expiryDateController;
  final TextEditingController checkNumberController;
  final TextEditingController cardHolderNameController;
  final Function()? onChanged;
  final Function()? toFront;
  final Function()? toBack;

  const CardInput({
    super.key,
    required this.cardNumberController,
    required this.expiryDateController,
    required this.checkNumberController,
    required this.cardHolderNameController,
    required this.onChanged,
    this.toFront,
    this.toBack,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.only(top: 30),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(
              width: 210,
              child: Column(
                children: [
                  const Text(
                    "CARD NUMBER",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                          controller: cardNumberController,
                        decoration: const InputDecoration(
                            focusedBorder:InputBorder.none,
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                          ),
                          onChanged: (_) {
                            onChanged!();
                            if(cardNumberController.text.length == 19){
                              toFront!();
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onEditingComplete: () {
                            toFront!();
                            FocusScope.of(context).nextFocus();
                          },
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(19),
                            FilteringTextInputFormatter.digitsOnly,
                            CustomInputFormatter()
                          ]))
                ],
              ),
            ),
            SizedBox(
              width: 100,
              child: Column(
                children: [
                  const Text(
                    "EXPIRY DATE",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                          controller: expiryDateController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          onChanged: (_) {
                            onChanged!();
                            if(expiryDateController.text.length == 4){
                              toBack!();
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () {
                            toBack!();
                            FocusScope.of(context).nextFocus();
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(4),
                            FilteringTextInputFormatter.digitsOnly
                          ]))
                ],
              ),
            ),
            SizedBox(
              width: 100,
              child: Column(
                children: [
                  const Text(
                    "CVV/CVC",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                          controller: checkNumberController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          onChanged: (_) {
                            onChanged!();

                            if(checkNumberController.text.length == 3){
                              toFront!();
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onEditingComplete: () {
                            toFront!();
                            FocusScope.of(context).nextFocus();
                          },
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(3),
                            FilteringTextInputFormatter.digitsOnly
                          ]))
                ],
              ),
            ),
            SizedBox(
              width: 200,
              child: Column(
                children: [
                  const Text(
                    "CARD HOLDER'S NAME",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                          controller: cardHolderNameController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          onChanged: (_) => onChanged!(),
                          textInputAction: TextInputAction.done,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp("[a-zA-Z ]"))
                          ]))
                ],
              ),
            ),
            SizedBox(width: 100,)
          ],
        ),
      ),
    );
  }
}


class CustomInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;
    StringBuffer buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      int nonZeroIndex = i + 1;

      buffer.write(text[i]);

      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) buffer.write(' ');
    }

    String newText = buffer.toString();
    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length)
    );
  }
}