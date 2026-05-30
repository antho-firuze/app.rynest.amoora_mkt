import 'package:flutter/material.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

class CustomButton2 extends StatefulWidget {
  const CustomButton2({super.key, this.text, this.onTap});

  final String? text;
  final Function()? onTap;

  @override
  State<CustomButton2> createState() => _CustomButton2State();
}

class _CustomButton2State extends State<CustomButton2> {
  double _val = 0.0;
  Color _col = Colors.blue;
  bool _isBusy = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_isBusy) return;

        _isBusy = true;
        setState(() {
          _val = 1.0;
          _col = Colors.white;
        });
      },
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 1000),
        tween: Tween(begin: 0.0, end: _val),
        onEnd: () {
          widget.onTap != null ? widget.onTap!() : null;
          _isBusy = false;
          setState(() {
            _col = Colors.blue;
            _val = 0.0;
          });
        },
        child: Text(widget.text ?? 'Hello World').tsButton(),
        builder: (context, value, child) {
          return Container(
            height: 40,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, _col, Colors.blue],
                stops: [0.0, value, 1.0],
              ),
            ),
            child: child,
          );
        },
      ),
    );
  }
}
