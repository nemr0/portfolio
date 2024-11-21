import 'package:flutter/widgets.dart';

class ScaleEffect extends StatefulWidget {
  const ScaleEffect({super.key, required this.child});

  final Widget child;

  @override
  State<ScaleEffect> createState() => _ScaleEffectState();
}

class _ScaleEffectState extends State<ScaleEffect> {
  late bool hover;
 @override
  void initState() {
      hover = false;
     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: hover ? 0.8 : 1,
      duration: Duration(milliseconds: 200),
      child: MouseRegion(
          onEnter: (_) {
            if (hover == false) setState(() => hover = true);
          },
          onExit: (_) {
            if (hover == true) setState(() => hover = false);
          },
          child: widget.child),
    );
  }
}
