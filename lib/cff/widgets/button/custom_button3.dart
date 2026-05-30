import 'package:flutter/material.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

class CustomButton3 extends StatefulWidget {
  const CustomButton3({super.key, this.text, this.onTap});

  final String? text;
  final Function()? onTap;

  @override
  State<CustomButton3> createState() => _CustomButton3State();
}

class _CustomButton3State extends State<CustomButton3> {
  double _val = 0.0;
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    double endPoint = context.screenWidth + 50;
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 1500),
      tween: Tween(begin: 0.0, end: _val),
      onEnd: () {
        widget.onTap != null ? widget.onTap!() : null;
        setState(() {
          _val = _val == endPoint ? 0.0 : _val;
          _visible = false;
        });
      },
      builder: (context, value, child) {
        return InkWell(
          onTap: () => setState(() {
            _val = endPoint;
            _visible = true;
          }),
          child: Container(
            height: 40,
            // alignment: Alignment.center,
            decoration: const BoxDecoration(color: Colors.grey),
            child: Row(
              children: [
                Center(
                  child: Text(widget.text ?? 'Hello World').tsButton().clr(Colors.white),
                ),
                Visibility(
                  visible: _visible,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
