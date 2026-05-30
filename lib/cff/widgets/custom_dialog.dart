import 'package:flutter/material.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key, this.leading, this.title, this.content, this.actions});

  final Widget? leading;
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(.8)),
      child: AlertDialog.adaptive(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
        actionsPadding: const EdgeInsets.only(right: 15, bottom: 10),
        title: Row(
          children: [
            if (leading != null) ...[leading!, 10.width],
            if (title != null) title!,
          ],
        ),
        content: content,
        actions: actions,
      ),
    );
  }
}
