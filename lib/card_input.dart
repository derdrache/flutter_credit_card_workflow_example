import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardInput extends StatelessWidget {
  final TextEditingController cardNumberController;
  final TextEditingController expiryDateController;
  final TextEditingController checkNumberController;
  final TextEditingController cardHolderNameController;
  final Function()? onChanged;
  final Function()? flipFront;
  final Function()? flipBack;

  const CardInput(
      {super.key,
      required this.cardNumberController,
      required this.expiryDateController,
      required this.checkNumberController,
      required this.cardHolderNameController,
      this.onChanged,
      this.flipFront,
      this.flipBack});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 30),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 210,
            child: Column(children: [
              Text("CARD NUMBER", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: cardNumberController,
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                  onChanged: (_){
                    onChanged!();

                    if(cardNumberController.text.length == 19){
                      flipFront!();
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  onEditingComplete: (){
                    flipFront!();
                    FocusScope.of(context).nextFocus();
                  },
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(19),
                    FilteringTextInputFormatter.digitsOnly,
                    CardNumberInputFormatter()
                  ],
                ),
              )
            ],),
          ),
          SizedBox(
            width: 100,
            child: Column(children: [
              Text("EXPIRY DATE", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: expiryDateController,
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                  onChanged: (_){
                    onChanged!();

                    if(expiryDateController.text.length == 4){
                      flipBack!();
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  onEditingComplete: (){
                    flipBack!();
                    FocusScope.of(context).nextFocus();
                  },
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(4),
                    FilteringTextInputFormatter.digitsOnly,

                  ],
                ),
              )
            ],),
          ),
          SizedBox(
            width: 100,
            child: Column(children: [
              Text("CVV/CVC", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: checkNumberController,
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                  onChanged: (_){
                    onChanged!();

                    if(checkNumberController.text.length == 3){
                      flipFront!();
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  onEditingComplete: (){
                    flipFront!();
                    FocusScope.of(context).nextFocus();
                  },
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(3),
                    FilteringTextInputFormatter.digitsOnly,

                  ],
                ),
              )
            ],),
          ),
          SizedBox(
            width: 200,
            child: Column(children: [
              Text("CARD HOLDERS'S NAME", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: cardHolderNameController,
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                  onChanged: (_) => onChanged!(),
                  textInputAction: TextInputAction.done,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))

                  ],
                ),
              )
            ],),
          ),
        ],
      ),
    ));
  }
}

class CardNumberInputFormatter extends TextInputFormatter{
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;
    StringBuffer buffer = StringBuffer();

    for(int i = 0; i < text.length; i++){
      int nonzeroIndex = i +1;

      buffer.write(text[i]);

      if(nonzeroIndex % 4 == 0 && nonzeroIndex != text.length){
        buffer.write(' ');
      }
    }

    String newText = buffer.toString();

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length)
    );
  }

}