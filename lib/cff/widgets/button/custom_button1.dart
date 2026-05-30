import 'package:flutter/material.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

class CustomButton1 extends StatefulWidget {
  const CustomButton1({super.key, this.text, this.onTap});

  final String? text;
  final Function()? onTap;

  @override
  State<CustomButton1> createState() => _CustomButton1State();
}

class _CustomButton1State extends State<CustomButton1> {
  var _begin = 0.0;
  var _end = 1.0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 1500),
        tween: Tween(begin: _begin, end: _end),
        onEnd: () {
          setState(() {
            _begin = _begin == 0.0 ? 1.0 : 0.0;
            _end = _end == 1.0 ? 0.0 : 1.0;
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
                colors: const [Colors.blue, Colors.white, Colors.blue],
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
