import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/context_extension.dart';

class IntroText extends StatelessWidget {
  const IntroText({super.key,});

  @override
  Widget build(BuildContext context) {
    return  RichText(
      maxLines: 4,
      overflow: TextOverflow.visible,
      text: TextSpan(
          text: 'Hi, my name is',
          style: context.textTheme.bodySmall,
          children: [
            TextSpan(
              text: ' Omar Elnemr,\n',
              style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
            ),
            TextSpan(text: 'I DEVELOP\nMOBILE\nAPPLICATIONS,',style: context.textTheme.bodyLarge,),
          ]),
    );
  }
}
