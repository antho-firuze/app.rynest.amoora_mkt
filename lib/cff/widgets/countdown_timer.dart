import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({
    super.key,
    required this.secondsRemaining,
    this.countDownStyle,
    this.whenTimeExpires,
    this.countDownFormatter,
  });

  final int secondsRemaining;
  final Function()? whenTimeExpires;
  final Function? countDownFormatter;
  final TextStyle? countDownStyle;

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Duration duration;

  String get timerDisplayString {
    Duration duration = _controller.duration! * _controller.value;
    return widget.countDownFormatter != null
        ? widget.countDownFormatter!(duration.inSeconds)
        : formatHHMMSS(duration.inSeconds);
    // In case user doesn't provide formatter use the default one
    // for that create a method which will be called formatHHMMSS or whatever you like
  }

  @override
  void initState() {
    super.initState();
    duration = Duration(seconds: widget.secondsRemaining);
    _controller = AnimationController(vsync: this, duration: duration)
      ..reverse(from: widget.secondsRemaining.toDouble())
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed ||
            status == AnimationStatus.dismissed) {
          if (widget.whenTimeExpires != null) {
            widget.whenTimeExpires!();
          }
        }
      });
  }

  @override
  // ignore: must_call_super
  void didUpdateWidget(CountDownTimer oldWidget) {
    if (widget.secondsRemaining != oldWidget.secondsRemaining) {
      setState(() {
        duration = Duration(seconds: widget.secondsRemaining);
        _controller.dispose();
        _controller = AnimationController(vsync: this, duration: duration)
          ..reverse(from: widget.secondsRemaining.toDouble())
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              if (widget.whenTimeExpires != null) {
                widget.whenTimeExpires!();
              }
            } else if (status == AnimationStatus.dismissed) {
              // print("Animation Complete");
            }
          });
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, Widget? child) {
          return Text(
            timerDisplayString,
            style: widget.countDownStyle,
          );
        },
      ),
    );
  }

  String formatHHMMSS(int seconds) {
    int hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    int minutes = (seconds / 60).truncate();

    String hoursStr = (hours).toString().padLeft(2, '0');
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    if (hours == 0) {
      return "$minutesStr:$secondsStr";
    }

    return "$hoursStr:$minutesStr:$secondsStr";
  }
}
