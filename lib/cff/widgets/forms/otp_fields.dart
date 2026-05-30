import 'package:amoora_mkt/cff/utils/orientation_utils.dart';
import 'package:flutter/material.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

final formStateKey = GlobalKey<FormState>();

class OTPFields extends StatelessWidget {
  const OTPFields({super.key, this.length = 4, this.onCompleted, this.minWidth});

  final int length;
  final double? minWidth;
  final void Function(String? pin)? onCompleted;

  @override
  Widget build(BuildContext context) {
    List<String> finalPin = List.generate(length, (index) => '');

    return SizedBox(
      width: context.isLandscape || context.isWidthScreen ? minWidth : double.infinity,
      child: Form(
        key: formStateKey,
        onChanged: () {
          formStateKey.currentState!.save();
      
          if (finalPin.join().length == length) {
            if (onCompleted != null) {
              onCompleted!(finalPin.join());
            }
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            length,
            (index) => BuildInputPin(index: index, onSaved: (pin) => finalPin[index] = pin ?? ''),
          ),
        ),
      ),
    );
  }
}

class BuildInputPin extends StatelessWidget {
  const BuildInputPin({super.key, this.onSaved, required this.index});

  final void Function(String? pin)? onSaved;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 54,
      height: 58,
      // width: 64,
      // height: 68,
      child: TextFormField(
        autofocus: true,
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.characters,
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.only(top: 30),
          // border: OutlineInputBorder(
          //   borderSide: const BorderSide(color: Colors.grey),
          //   borderRadius: BorderRadius.circular(10),
          // ),
          // focusedBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.cyan[200]!),
          //   borderRadius: BorderRadius.circular(10),
          // ),
        ),
        textAlign: TextAlign.center,
        style: tsHeadline(),
        onSaved: onSaved,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty) {
            if (index > 0) {
              FocusScope.of(context).previousFocus();
            }
          }
        },
      ),
    );
  }
}
