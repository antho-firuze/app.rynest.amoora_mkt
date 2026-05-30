import 'package:flutter/material.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

class Pill extends StatelessWidget {
  const Pill({super.key, required this.title, this.color});

  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    var clr = color ?? Colors.green;
    var backgroundColor = clr.withValues(alpha: 0.2);
    var fontColor = clr.withValues(alpha: 0.9);

    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(color: backgroundColor, borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Text(title).tsLabel().clr(fontColor),
      ),
    );
  }
}
