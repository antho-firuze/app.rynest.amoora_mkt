import 'package:flutter/material.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

import 'pill_gesture.dart';

Future<T?> showBottomSlide<T>({
  required BuildContext context,
  required Widget child,
  String? title,
  Color? barrierColor,
  bool barrierDismissible = true,
  Duration transitionDuration = const Duration(milliseconds: 300),
  Color? pillColor,
  Color? backgroundColor,
  double maxSize = 1,
  bool movable = true,
}) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (context, animation1, animation2) => const SizedBox(),
    barrierColor: barrierColor ?? Colors.black.withValues(alpha: 0.7),
    barrierDismissible: barrierDismissible,
    barrierLabel: "Dismiss",
    transitionDuration: transitionDuration,
    transitionBuilder: (context, animation1, animation2, widget) {
      final curvedValue = Curves.easeInOut.transform(animation1.value) - 1.0;
      return Transform(
        transform: Matrix4.translationValues(0.0, curvedValue * -300, 0.0),
        child: Opacity(
          opacity: animation1.value,
          child: SlideDialog(
            context,
            pillColor: pillColor ?? Colors.blueGrey,
            backgroundColor: backgroundColor ?? Theme.of(context).canvasColor,
            maxSize: maxSize,
            title: title,
            movable: movable,
            child: child,
          ),
        ),
      );
    },
  );
}

class SlideDialog extends StatefulWidget {
  const SlideDialog(
    this.context, {
    super.key,
    required this.child,
    required this.pillColor,
    required this.backgroundColor,
    this.maxSize = 1,
    this.title,
    this.movable = false,
  });

  final BuildContext context;
  final Widget child;
  final Color backgroundColor;
  final Color pillColor;
  final double maxSize;
  final String? title;
  final bool movable;

  @override
  State<SlideDialog> createState() => _SlideDialogState();
}

class _SlideDialogState extends State<SlideDialog> {
  MediaQueryData? _mediaQueryData;
  double deviceWidth = 0.0;
  double deviceHeight = 0.0;
  double paddingTop = 0.0;
  double _currentPosition = 0.0;

  @override
  void initState() {
    _mediaQueryData = MediaQuery.of(widget.context);
    deviceWidth = widget.context.screenWidth;
    deviceHeight = widget.context.screenHeight;
    paddingTop = MediaQuery.of(widget.context).padding.top;
    _currentPosition = MediaQuery.of(widget.context).size.height * (1 - widget.maxSize);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _currentPosition = _currentPosition < 1 ? paddingTop : _currentPosition;

    BorderRadius borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(20.0),
      topRight: Radius.circular(20.0),
    );

    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets + EdgeInsets.only(top: _currentPosition),
      duration: const Duration(milliseconds: 100),
      curve: Curves.decelerate,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: SizedBox(
            width: deviceWidth,
            height: deviceHeight - paddingTop,
            child: Material(
              color: widget.backgroundColor,
              elevation: 24.0,
              type: MaterialType.card,
              shape: RoundedRectangleBorder(borderRadius: borderRadius),
              child: Column(
                children: <Widget>[
                  Material(
                    shape: RoundedRectangleBorder(borderRadius: borderRadius),
                    elevation: 5.0,
                    child: Column(
                      children: [
                        widget.movable
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: PillGesture(
                                  onVerticalDragStart: _onVerticalDragStart,
                                  onVerticalDragEnd: _onVerticalDragEnd,
                                  onVerticalDragUpdate: _onVerticalDragUpdate,
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: widget.title == null
                                            ? Container()
                                            : Text(widget.title!, style: const TextStyle(fontSize: 18)),
                                      ),
                                    ),
                                    IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                  Expanded(child: SingleChildScrollView(child: widget.child)),
                  // widget.movable
                  //     ? SingleChildScrollView(child: widget.child)
                  //     : SingleChildScrollView(
                  //         child: Container(
                  //             height: deviceHeight - _currentPosition - 90,
                  //             child: widget.child),
                  //       ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onVerticalDragStart(DragStartDetails drag) {
    setState(() {
      // _initialPosition = drag.globalPosition.dy;
    });
  }

  void _onVerticalDragUpdate(DragUpdateDetails drag) {
    setState(() {
      final temp = _currentPosition;
      _currentPosition = drag.globalPosition.dy;
      // print(drag.globalPosition.dy);
      if (_currentPosition < 0) {
        _currentPosition = temp;
      }
    });
  }

  void _onVerticalDragEnd(DragEndDetails drag) {
    double offset75 = deviceHeight * (1 - 0.75);
    double offset50 = deviceHeight * (1 - 0.5);
    double offset35 = deviceHeight * (1 - 0.35);

    if (_currentPosition > offset35) {
      Navigator.pop(context);
      return;
    }
    setState(() {
      if (_currentPosition < offset75) {
        _currentPosition = _mediaQueryData!.padding.top;
      } else if (_currentPosition < offset50) {
        _currentPosition = offset75;
      } else if (_currentPosition < offset35) {
        _currentPosition = offset50;
      }
    });
  }
}
