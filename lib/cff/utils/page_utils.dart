import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'router.dart';

extension PageUtilContext on BuildContext {
  Future goto({required Widget page}) async => await Navigator.of(this, rootNavigator: true).push(CupertinoPageRoute(
        builder: (context) => page,
      ));

  void popz() => Navigator.of(this).pop();
}

class PageUtils {
  Ref ref;
  PageUtils(this.ref);

  Future goto({required Widget page}) async =>
      await Navigator.of(rootNavigatorKey.currentContext!, rootNavigator: true).push(CupertinoPageRoute(
        builder: (context) => page,
      ));

  /// Navigate to a location.
  void go(String location, {Object? extra}) => GoRouter.of(rootNavigatorKey.currentContext!).go(location, extra: extra);
}

final pageUtilsProvider = Provider(PageUtils.new);
