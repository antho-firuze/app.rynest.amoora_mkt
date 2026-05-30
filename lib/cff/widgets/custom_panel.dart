import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';

class CustomPanel extends StatefulWidget {
  const CustomPanel({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.content,
    this.defaultExpanded = false,
    this.expandedheight = 60,
    this.duration = const Duration(milliseconds: 300),
  });

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? content;
  final bool defaultExpanded;
  final double expandedheight;
  final Duration duration;

  @override
  State<CustomPanel> createState() => _CustomPanelState();
}

class _CustomPanelState extends State<CustomPanel> {
  late bool expanded;

  @override
  void initState() {
    super.initState();
    expanded = widget.defaultExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: widget.leading,
          title: widget.title,
          subtitle: widget.subtitle,
          trailing: expanded ? Icon(SuperIcons.mg_up_line) : Icon(SuperIcons.mg_down_line),
          onTap: () => setState(() {
            expanded = !expanded;
          }),
        ),
        if (widget.content != null)
          AnimatedSize(
            duration: widget.duration,
            child: SizedBox.fromSize(
              size: Size.fromHeight(expanded ? widget.expandedheight : 0),
              child: SingleChildScrollView(child: widget.content!),
            ),
          ),
      ],
    );
  }
}
