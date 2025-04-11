import 'package:flutter/material.dart';
import 'package:portfolio/presentation/shared_widgets/shadow_button.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({super.key, required this.onPressed});
  final Future<void> Function() onPressed;
  @override
  Widget build(BuildContext context) {

        return ShadowButton.text(
          text: 'CONTACT ME',
          animate:true ,
          onPressed: onPressed,
        );

  }
}