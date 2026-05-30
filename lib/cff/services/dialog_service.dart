import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:amoora_mkt/cff/utils/router.dart';

import '../widgets/button/custom_button.dart';
import '../widgets/custom_dialog.dart';

enum PressedType { ok, yes, no }

class DialogService {
  const DialogService({this.leading, this.title, this.content, this.actions, this.dismissable = true, this.onPressed});
  final Widget? leading;
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;
  final bool dismissable;
  final Function(PressedType type)? onPressed;

  Future<void> show() async => await showAdaptiveDialog(
    context: rootNavigatorKey.currentContext!,
    barrierDismissible: dismissable,
    builder: (context) {
      return PopScope(
        canPop: dismissable,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
        },
        child: CustomDialog(leading: leading, title: title, content: content, actions: actions),
      );
    },
  );

  Future<void> showOk() async => await showAdaptiveDialog(
    context: rootNavigatorKey.currentContext!,
    barrierDismissible: dismissable,
    builder: (context) {
      return PopScope(
        canPop: dismissable,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
        },
        child: CustomDialog(
          leading: leading,
          title: title,
          content: content,
          actions: [
            CustomButton(
              child: Text('OK'),
              onPressed: () {
                if (onPressed != null) onPressed!(PressedType.ok);
                context.pop();
              },
            ),
          ],
        ),
      );
    },
  );

  Future<void> showConfirm() async => await showAdaptiveDialog(
    context: rootNavigatorKey.currentContext!,
    barrierDismissible: dismissable,
    builder: (context) {
      return PopScope(
        canPop: dismissable,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
        },
        child: CustomDialog(
          leading: leading,
          title: title,
          content: content,
          actions: [
            CustomButton(
              child: Text('No'),
              onPressed: () {
                if (onPressed != null) onPressed!(PressedType.no);
                context.pop();
              },
            ),
            CustomButton(
              child: Text('Yes'),
              onPressed: () {
                if (onPressed != null) onPressed!(PressedType.yes);
                context.pop();
              },
            ),
          ],
        ),
      );
    },
  );
}
