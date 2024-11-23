import 'dart:ui';

import 'package:flutter/widgets.dart';

class ScaleEffect extends StatefulWidget {
  const ScaleEffect({super.key, required this.child});

  final Widget child;

  @override
  State<ScaleEffect> createState() => _ScaleEffectState();
}

class _ScaleEffectState extends State<ScaleEffect> {
  late bool hover;
  PointerDeviceKind? kind;
 @override
  void initState() {
      hover = false;
     super.initState();
  }
  hoverAction(){
    if (hover == false) {
      setState(() => hover = true);
      Future.delayed(Duration(milliseconds: 400),()=>
          setState(()=> hover = false));
    }
  }
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (details){
        if(details.kind == PointerDeviceKind.touch){
          hoverAction();
        }
      },
      onEnter: (details) {
        kind = details.kind;

        hoverAction();
      },

      child: AnimatedScale(
        scale: hover ? 0.8 : 1,
        duration: Duration(milliseconds: 200),
        child: widget.child,
      ),
    );
  }
}
