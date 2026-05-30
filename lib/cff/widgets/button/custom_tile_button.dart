import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:flutter/material.dart';

class CustomTileButton extends StatelessWidget {
  const CustomTileButton({
    super.key,
    this.colorAllowed = oBasilGreen,
    this.colorDisallowed = oRed,
    this.state = false,
    required this.title,
    this.onPressed,
  });

  final bool state;
  final String title;
  final Color colorAllowed;
  final Color colorDisallowed;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
          backgroundColor: state ? oBasilGreen : oRed,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(title)),
            SizedBox(width: 70, child: Icon(state ? Icons.check_circle : Icons.error_outline)),
          ],
        ),
      ),
    );
  }
}
