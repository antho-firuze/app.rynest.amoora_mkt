import 'package:flutter/cupertino.dart';
import 'package:amoora_mkt/cff/utils/router.dart';

class AlertService {
  static Future<bool?> show({
    required String body,
    String title = 'Informasi',
    String? noCaption,
    String? okCaption,
    String? yesCaption,
    VoidCallback? onNo,
    VoidCallback? onOk,
    VoidCallback? onYes,
    bool showNo = false,
    bool showOk = false,
    bool showYes = false,
  }) async {
    return await showCupertinoModalPopup<bool>(
      context: rootNavigatorKey.currentContext!,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          if (showOk)
            CupertinoDialogAction(
              isDefaultAction: true,
              isDestructiveAction: true,
              onPressed: () {
                Navigator.of(context).pop(true);
                if (onOk != null) onOk();
              },
              child: Text(okCaption ?? "Ok"),
            ),
          if (showYes)
            CupertinoDialogAction(
              isDefaultAction: true,
              isDestructiveAction: true,
              onPressed: () {
                Navigator.of(context).pop(true);
                if (onYes != null) onYes();
              },
              child: Text(yesCaption ?? "Ya"),
            ),
          if (showNo)
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop(false);
                if (onNo != null) onNo();
              },
              child: Text(noCaption ?? "Tidak"),
            ),
        ],
      ),
    );
  }

  static Future<bool?> confirm({
    required String body,
    String title = 'Konfirmasi',
    String? noCaption,
    String? yesCaption,
    VoidCallback? onNo,
    VoidCallback? onYes,
    bool showNo = true,
    bool showYes = true,
  }) async {
    return await AlertService.show(
      title: title,
      body: body,
      noCaption: noCaption,
      yesCaption: yesCaption,
      onNo: onNo,
      onYes: onYes,
      showNo: showNo,
      showYes: showYes,
    );
  }

  static Future<bool?> showOk({
    required String body,
    String title = 'Informasi',
    String? okCaption,
    VoidCallback? onOk,
  }) async {
    return await AlertService.show(title: title, body: body, okCaption: okCaption, onOk: onOk, showOk: true);
  }
}
