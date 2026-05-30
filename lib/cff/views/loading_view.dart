import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({super.key, this.messages});

  final List<String>? messages;

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  Timer? timer;
  int counter = 1, index = 0;
  List<String>? messages = ["proses", "masih proses", "hampir selesai"];
  // List<String>? messages = ["loading...", "it's still loading...", "almost there..."];
  var message = '';

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) => counterUp());
  }

  void counterUp() {
    if (counter % 5 == 0) {
      index++;
      if (index > messages!.length - 1) index = messages!.length - 1;
      message = messages![index];
    } else {
      message += '.';
    }
    counter++;
    setState(() {});
  }

  @override
  void initState() {
    messages = widget.messages ?? messages;
    message = messages![0];
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          decoration: BoxDecoration(color: const Color(0x69000000), borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 50,
                child: SpinKitCircle(
                  itemBuilder: (context, index) {
                    final colors = [primaryLight, secondaryLight];
                    final color = colors[index % colors.length];
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: color,
                        // shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
              ),
              10.height,
              Text(message).tsTitle().clr(oWhite).size(12),
            ],
          ),
        ),
      ),
    );
  }
}
