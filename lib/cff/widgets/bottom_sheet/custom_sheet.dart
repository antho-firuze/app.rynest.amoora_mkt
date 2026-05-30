import 'dart:developer';

import 'package:flutter/material.dart';

import 'pill_gesture.dart';

class CustomSheet extends StatefulWidget {
  const CustomSheet({
    super.key,
    this.child,
    this.pillColor,
    this.backgroundColor,
    this.maxSize = 1,
    this.movable = true,
    this.isExpanded = true,
    this.title,
    this.actions,
  });

  final Widget? title;
  final List<Widget>? actions;
  final Widget? child;
  final Color? backgroundColor;
  final Color? pillColor;
  final double maxSize;
  final bool movable;
  final bool isExpanded;

  @override
  State<CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<CustomSheet> {
  late MediaQueryData _mediaQuery;
  late double _paddingTop;
  late double _maxSize;
  late double _minSize;
  late double _lastPosition;
  late bool _isExpanded;
  double _width = 0.0;
  double _height = 0.0;
  double _currentPosition = 0.0;

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        _mediaQuery = MediaQuery.of(context);
        _paddingTop = _mediaQuery.padding.top;

        _width = _mediaQuery.size.width;
        _height = _mediaQuery.size.height;

        log('_height * (1 - widget.maxSize) = ${_height * (1 - widget.maxSize)}');
        _maxSize = (_height * (1 - widget.maxSize));
        _maxSize = _maxSize == 0 ? _paddingTop : _maxSize;
        _minSize = _height - 25;

        _isExpanded = widget.isExpanded;
        _currentPosition = _isExpanded ? _maxSize : _minSize;
        _lastPosition = _height * .5;
      },
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _mediaQuery = MediaQuery.of(context);
    _paddingTop = _mediaQuery.padding.top;

    _width = _mediaQuery.size.width;
    _height = _mediaQuery.size.height;

    log('_height * (1 - widget.maxSize) = ${_height * (1 - widget.maxSize)}');
    _maxSize = (_height * (1 - widget.maxSize));
    _maxSize = _maxSize == 0 ? _paddingTop : _maxSize;
    _minSize = _height - 30;

    _isExpanded = widget.isExpanded;
    _currentPosition = _isExpanded ? _maxSize : _minSize;
    _lastPosition = _height * .5;
    super.didChangeDependencies();
  }

  BorderRadius borderRadius = const BorderRadius.only(
    topLeft: Radius.circular(20.0),
    topRight: Radius.circular(20.0),
  );

  void toggle() {
    _currentPosition = _isExpanded ? _minSize : _lastPosition;
    _isExpanded = !_isExpanded;
    log('toggle click');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _currentPosition = _currentPosition < 1 ? _maxSize : _currentPosition;

    log('Build Custom Sheet');
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        debugPrint('onPopInvoked');
        if (_isExpanded) {
          toggle();
        } else {
          Navigator.pop(context);
        }
      },
      child: AnimatedPadding(
        padding: _mediaQuery.viewInsets + EdgeInsets.only(top: _currentPosition),
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
              width: _width,
              height: _height - _maxSize,
              child: PillGesture(
                onVerticalDragStart: _onVerticalDragStart,
                onVerticalDragEnd: _onVerticalDragEnd,
                onVerticalDragUpdate: _onVerticalDragUpdate,
                child: Material(
                  color: widget.backgroundColor,
                  elevation: 24.0,
                  type: MaterialType.card,
                  shape: RoundedRectangleBorder(
                    borderRadius: borderRadius,
                  ),
                  child: Stack(
                    // shrinkWrap: true,
                    // padding: EdgeInsets.zero,
                    // physics: const ClampingScrollPhysics(),
                    children: [
                      pillStripe(),
                      topBar(),
                      // Stack(
                      //   children: [
                      //     widget.child ?? Container(),
                      //     // SingleChildScrollView(
                      //     //   physics: const ClampingScrollPhysics(),
                      //     //   child: widget.child ?? Container(),
                      //     // ),
                      //   ],
                      // ),
                      // Expanded(child: SingleChildScrollView(child: widget.child)),
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
        ),
      ),
    );
  }

  Widget topBar() {
    return Align(
      alignment: Alignment.topCenter,
      child: AnimatedFractionallySizedBox(
        duration: const Duration(milliseconds: 300),
        heightFactor: _isExpanded ? 40 : 0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: widget.title,
            ),
            if (widget.actions != null)
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: widget.actions!.reversed.toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget pillStripe() {
    return InkWell(
      onTap: toggle,
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: FractionallySizedBox(
            widthFactor: .2,
            child: Container(
              height: 5.0,
              decoration: BoxDecoration(
                color: widget.pillColor ?? Colors.grey,
                borderRadius: BorderRadius.circular(50.0),
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
      if (_currentPosition < 0) {
        _currentPosition = temp;
      }
    });
  }

  void _onVerticalDragEnd(DragEndDetails drag) {
    // reference: offset 0.0 is top
    double offset35 = _height * .35;
    double offset50 = _height * .5;
    double offset75 = _height * .75;

    if (_currentPosition < offset35) {
      _currentPosition = _maxSize;
      _isExpanded = true;
      _lastPosition = _currentPosition;
    } else if (_currentPosition < offset50) {
      _currentPosition = offset50;
      _isExpanded = true;
      _lastPosition = _currentPosition;
    } else if (_currentPosition < offset75) {
      _currentPosition = offset50;
      _isExpanded = true;
      _lastPosition = _currentPosition;
    } else if (_currentPosition > offset75) {
      _currentPosition = _minSize;
      _isExpanded = false;
      _lastPosition = _height * .5;
    }

    setState(() {});
  }
}
