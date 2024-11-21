import 'package:flutter/material.dart';

class ItemAnimationBuilder extends StatelessWidget {
  const ItemAnimationBuilder(
      {super.key, required this.child, required this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1,).animate(animation),
      child: SlideTransition(
        position: Tween<Offset>(begin: Offset(-0.1, 0), end: Offset.zero,).animate(animation),
        child: child,
      ),
    );
  }
}
