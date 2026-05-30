import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:flutter/material.dart';

const borderRadius = BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25));

class PillStripe extends StatelessWidget {
  const PillStripe({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: primaryLight, borderRadius: borderRadius),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: FractionallySizedBox(
              widthFactor: .2,
              child: Container(
                height: 5.0,
                decoration: BoxDecoration(color: Colors.grey[400], borderRadius: BorderRadius.circular(50.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
