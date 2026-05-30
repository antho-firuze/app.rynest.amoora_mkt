import 'package:flutter/material.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key, required this.value, this.caption, required this.onChanged, this.captionW});

  final bool value;
  final String? caption;
  final Widget? captionW;
  final Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: const Border.fromBorderSide(BorderSide(color: primaryLight, width: 1.5)),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Checkbox(
            value: value,
            activeColor: Colors.transparent,
            onChanged: (value) {
              onChanged!(value!);
            },
            side: const BorderSide(color: Colors.transparent),
            checkColor: primaryLight,
          ),
        ),
        10.width,
        Expanded(
          child: InkWell(
            onTap: () => onChanged!(!value),
            child: Align(
              alignment: Alignment.centerLeft,
              child: caption == null ? captionW : Text(caption ?? '').tsBody(),
            ),
          ),
        ),
      ],
    );
  }
}
