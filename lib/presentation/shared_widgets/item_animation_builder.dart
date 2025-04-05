import 'package:flutter/material.dart';

class ItemAnimationBuilder extends StatelessWidget {
  const ItemAnimationBuilder(
      {super.key, required this.child, required this.animation,  this.fromGrid=false});

  final Widget child;
  final Animation<double> animation;
  final bool fromGrid;

  @override
  Widget build(BuildContext context) {

    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1,).animate(animation),
      child: SlideTransition(
        position: fromGrid ?
        Tween<Offset>(begin: Offset(0, -0.1), end: Offset.zero,).animate(animation):
        Tween<Offset>(begin: Offset(-0.1, 0), end: Offset.zero,).animate(animation),
        child: child,
      ),
    );
  }
}
