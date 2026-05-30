import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:super_icons/super_icons.dart';
import 'package:amoora_mkt/cff/widgets/button/custom_iconbutton.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/features/user/controller/carousel_ctrl.dart';
import 'package:amoora_mkt/features/user/views/widgets/hero_layout_card.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({
    super.key,
    required this.items,
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(seconds: 4),
  });

  final List<CarouselItems> items;
  final bool autoPlay;
  final Duration autoPlayInterval;

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late PageController _pageController;
  late Timer _timer;
  int _currentIndex = 0;
  late Duration _autoPlayInterval;

  @override
  void initState() {
    super.initState();
    _autoPlayInterval = widget.autoPlayInterval;

    _pageController = PageController();

    _timer = Timer.periodic(_autoPlayInterval, (_) => _animatedToNextPage());
    // _carouselController.addListener(_listener);
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  // void _listener() {
  //   final position = _carouselController.position;
  //   final width = _itemExtent; //your width
  //   if (position.hasPixels) {
  //     final index = (position.pixels / width).round();
  //     if (_currentIndex != index) {
  //       log("index : $index | position.pixels : ${position.pixels} | width : $width", name: "CUSTOM-CAROUSEL");
  //       _currentIndex = index;
  //       _pageController.animateToPage(_currentIndex, duration: Duration(milliseconds: 500), curve: Curves.linear);
  //       setState(() {});
  //     }
  //   }
  // }

  void _animatedToNextPage() {
    int nextIndex = 0;
    if (_currentIndex >= widget.items.length - 1) {
      nextIndex = 0;
    } else if (_currentIndex <= 0) {
      nextIndex = 1;
    } else {
      nextIndex = _currentIndex + 1;
    }

    if (widget.autoPlay) {
      _pageController.animateToPage(nextIndex, duration: Duration(milliseconds: 500), curve: Curves.linear);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // PAGEVIEW
          SizedBox(
            height: 200,
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) => _currentIndex = value,
              children: widget.items.map((walk) {
                return HeroLayoutCard(item: walk);
              }).toList(),
            ),
          ),
          // NAVIGATION
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                icon: Icon(SuperIcons.mg_left_line, color: oGrey),
                color: Colors.transparent,
                onPressed: () {
                  _pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.linear);
                },
              ),
              CustomIconButton(
                icon: Icon(SuperIcons.mg_right_line, color: oGrey),
                color: Colors.transparent,
                onPressed: () {
                  _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.linear);
                },
              ),
            ],
          ),
          // PAGE INDICATOR
          Positioned(
            bottom: -20,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: widget.items.length,
              effect: ExpandingDotsEffect(dotHeight: 10, dotWidth: 10, dotColor: oGrey, activeDotColor: oGrey),
            ),
          ),
        ],
      ),
    );
  }
}
