import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText(this.text, {super.key, this.textAlign});

  final TextSpan text;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text.rich(text, textScaler: const TextScaler.linear(.8), textAlign: textAlign ?? TextAlign.start);
    // return RichText(
    //   textScaler: const TextScaler.linear(.8),
    //   textAlign: textAlign ?? TextAlign.start,
    //   text: text,
    // );
  }
}
