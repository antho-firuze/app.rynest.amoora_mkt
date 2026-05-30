import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';

class HorizontalContainer extends StatefulWidget {
  const HorizontalContainer({super.key, required this.children, this.arrowColor});

  final List<Widget> children;
  final Color? arrowColor;

  @override
  State<HorizontalContainer> createState() => _HorizontalContainerState();
}

class _HorizontalContainerState extends State<HorizontalContainer> {
  var controller = ScrollController();
  bool showLeftArrow = false;
  bool showRightArrow = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.addListener(_scrollListener);
      _scrollListener();
    });
    super.initState();
  }

  void _scrollListener() {
    final offset = controller.offset;
    final minOffset = controller.position.minScrollExtent;
    final maxOffset = controller.position.maxScrollExtent;

    setState(() {
      showLeftArrow = offset > minOffset;
      showRightArrow = maxOffset > 0 && offset < maxOffset;
    });
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 24,
          child: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: controller,
            padding: const EdgeInsets.only(left: 4),
            children: widget.children,
          ),
        ),
        if (showLeftArrow)
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                controller.animateTo(
                  controller.offset - 100,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear,
                );
              },
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: Icon(Icons.chevron_left, color: widget.arrowColor ?? primaryLight),
                  ),
                ),
              ),
            ),
          ),
        if (showRightArrow)
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                controller.animateTo(
                  controller.offset + 100,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear,
                );
              },
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: Icon(Icons.chevron_right, color: widget.arrowColor ?? primaryLight),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
