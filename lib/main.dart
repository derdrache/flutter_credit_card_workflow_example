import 'package:flutter/material.dart';
import 'package:flutter_credit_card_workflow_example/card_input.dart';
import 'package:flutter_credit_card_workflow_example/credit_card_back.dart';

import 'card_animation.dart';
import 'credit_card_front.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController checkNumberController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        children: [
          CardAnimation(
              startChild: CreditCardFront(
                  cardNumber: cardNumberController.text,
                  expiryDate: expiryDateController.text,
                  cardHolderName: cardHolderNameController.text),
              endChild: CreditCardBack(
                controllNumber: checkNumberController.text,
              ),
              animationController: animationController),
          CardInput(
            cardNumberController: cardNumberController,
            expiryDateController: expiryDateController,
            checkNumberController: checkNumberController,
            cardHolderNameController: cardHolderNameController,
            onChanged: () => setState(() {}),
            flipFront: () => animationController.reverse(),
            flipBack: () => animationController.forward(),
          )
        ],
      ),
    ));
  }
}
