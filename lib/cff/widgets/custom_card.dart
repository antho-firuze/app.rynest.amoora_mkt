import 'package:amoora_mkt/cff/widgets/custom_ink_well.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, this.child, this.color, this.onTap});

  final Widget? child;
  final Color? color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ClipPath(
        clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
        child: CustomInkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              // color: Colors.transparent,
              border: const Border(bottom: BorderSide(color: Colors.transparent, width: 8)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
