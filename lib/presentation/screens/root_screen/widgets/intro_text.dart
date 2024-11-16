import 'package:flutter/material.dart';

class IntroText extends StatelessWidget {
  const IntroText({super.key});

  @override
  Widget build(BuildContext context) {
    return  RichText(
      maxLines: 4,
      overflow: TextOverflow.visible,
      text: TextSpan(
          text: 'Hi, my name is',
          style: Theme.of(context).textTheme.bodySmall,
          children: [
            TextSpan(
              text: ' Omar Elnemr,\n',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
            ),
            TextSpan(text: 'I DEVELOP\nMOBILE\nAPPLICATIONS,',style: Theme.of(context).textTheme.bodyLarge,),
          ]),
    );
  }
}
