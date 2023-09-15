import 'dart:math';

import 'package:flutter/material.dart';

class CardAnimation extends StatefulWidget {
  final Widget startChild;
  final Widget endChild;
  final AnimationController animationController;

  const CardAnimation(
      {super.key,
      required this.startChild,
      required this.endChild,
      required this.animationController});

  @override
  State<CardAnimation> createState() => _CardAnimationState();
}

class _CardAnimationState extends State<CardAnimation> {
  late Animation animation;
  AnimationStatus animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();

    animation = Tween(end: 1.0, begin: 0.0).animate(widget.animationController)
      ..addListener(() {
        setState(() {

        });
      })
      ..addStatusListener((status) {
        animationStatus = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.002)
        ..setRotationY(animation.value >= 0.5
          ? pi * (animation.value -1)
          : pi * animation.value),
      child: animation.value <= 0.5
        ? widget.startChild
        : widget.endChild,
    );
  }
}
