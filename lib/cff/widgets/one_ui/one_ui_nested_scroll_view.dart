import 'package:flutter/cupertino.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:amoora_mkt/cff/widgets/fade_animation.dart';
import 'package:amoora_mkt/cff/widgets/one_ui/one_ui_scroll_physics.dart';

class OneUINestedScrollView extends StatefulWidget {
  const OneUINestedScrollView({
    super.key,
    this.expandedHeight = 200,
    this.tollbarHeight = kToolbarHeight,
    this.expandedWidget,
    this.collapsedWidget,
    this.boxDecoration,
    this.leadingIcon,
    this.actions,
    required this.sliverList,
    this.sliverBackgroundColor,
    this.globalKey,
    this.bottomHeader,
    this.background,
    this.automaticallyImplyLeading = true,
    this.foregroundColor,
    this.onRefresh,
  });

  final double expandedHeight;
  final double tollbarHeight;
  final Widget? expandedWidget;
  final Widget? collapsedWidget;
  final BoxDecoration? boxDecoration;
  final Widget? background;
  final Widget? leadingIcon;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  final SliverList sliverList;
  final Color? sliverBackgroundColor;
  final Color? foregroundColor;
  final PreferredSizeWidget? bottomHeader;
  final Future<void> Function()? onRefresh;

  final GlobalKey<NestedScrollViewState>? globalKey;

  @override
  State<OneUINestedScrollView> createState() => _OneUINestedScrollViewState();
}

class _OneUINestedScrollViewState extends State<OneUINestedScrollView> {
  late double _expandedHeight;
  late double _toolbarHeight;
  late GlobalKey<NestedScrollViewState> _nestedScrollViewState;
  Future<void>? scrollAnimate;

  double calculateExpandRatio(BoxConstraints constraints) {
    var expandRatio = (constraints.maxHeight - _toolbarHeight) / (_expandedHeight - _toolbarHeight);
    if (expandRatio > 1.0) expandRatio = 1;
    if (expandRatio < 0.0) expandRatio = 0;
    return expandRatio;
  }

  List<Widget> headerSliverBuilder(context, innerBoxIsScrolled) => [
    SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverAppBar(
        pinned: true,
        automaticallyImplyLeading: false,
        expandedHeight: _expandedHeight,
        toolbarHeight: _toolbarHeight,
        bottom: widget.bottomHeader,
        flexibleSpace: LayoutBuilder(
          builder: (context, constraints) {
            final expandRatio = calculateExpandRatio(constraints);
            final animation = AlwaysStoppedAnimation(expandRatio);
            // print(expandRatio);
            return Stack(
              children: [
                // Background color, image or gradient
                if (widget.background != null) ...[
                  FadeAnimation(animation: animation, isExpanded: true, child: widget.background!),
                  Container(color: oBlack.withOpacity(.3)),
                ],
                Container(decoration: widget.boxDecoration),
                // Center big title
                Center(
                  child: FadeAnimation(
                    animation: animation,
                    isExpanded: true,
                    child: widget.expandedWidget ?? Container(),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: _toolbarHeight,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Leading Icon
                        if (widget.leadingIcon == null && widget.automaticallyImplyLeading)
                          IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: Icon(Icons.chevron_left, size: 35, color: widget.foregroundColor),
                          )
                        else
                          widget.leadingIcon ?? Container(),
                        // Collapsed widget / small name
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: widget.leadingIcon == null && !widget.automaticallyImplyLeading ? 20 : 0,
                            ),
                            child: FadeAnimation(
                              animation: animation,
                              isExpanded: false,
                              child: widget.collapsedWidget ?? Container(),
                            ),
                          ),
                        ),
                        // Actions widget
                        if (widget.actions != null)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: widget.actions!.reversed.toList(),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    ),
  ];

  Widget body() => Container(
    color: widget.sliverBackgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
    child: Builder(
      builder: (BuildContext context) => CustomScrollView(
        slivers: [
          SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
          widget.sliverList,
        ],
      ),
    ),
  );

  bool onNotification(ScrollEndNotification notification) {
    final scrollViewState = _nestedScrollViewState.currentState;
    final outerController = scrollViewState!.outerController;

    if (scrollViewState.innerController.position.pixels == 0 && !outerController.position.atEdge) {
      final range = _expandedHeight - _toolbarHeight;
      final snapOffset = (outerController.offset / range) > 0.55 ? range : 0.0;

      Future.microtask(() async {
        if (scrollAnimate != null) await scrollAnimate;
        scrollAnimate = outerController.animateTo(
          snapOffset,
          duration: const Duration(milliseconds: 150),
          curve: Curves.ease,
        );
      });
    }

    return false;
  }

  @override
  void initState() {
    _nestedScrollViewState = widget.globalKey ?? GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _expandedHeight = widget.expandedHeight;
    _toolbarHeight = widget.tollbarHeight;

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return true;
      },
      child: NotificationListener<ScrollEndNotification>(
        onNotification: onNotification,
        child: NestedScrollView(
          key: _nestedScrollViewState,
          headerSliverBuilder: headerSliverBuilder,
          physics: OneUIScrollPhysics(_expandedHeight),
          body: RefreshIndicator(onRefresh: widget.onRefresh ?? () async {}, child: body()),
        ),
      ),
    );
  }
}
