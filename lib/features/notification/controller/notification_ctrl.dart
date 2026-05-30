import 'dart:async';

import 'package:amoora_mkt/cff/models/reqs.dart';
import 'package:amoora_mkt/cff/services/api_service.dart';
import 'package:amoora_mkt/cff/services/sharedpref_service.dart';
import 'package:amoora_mkt/cff/core/app_base.dart';
import 'package:amoora_mkt/cff/services/sse_service2.dart';
import 'package:amoora_mkt/cff/utils/log_utils.dart';
import 'package:amoora_mkt/features/auth/controller/auth_controller.dart';
import 'package:amoora_mkt/features/notification/model/alert.dart';
import 'package:amoora_mkt/cff/utils/string_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_ctrl.g.dart';

final _kLogName = "NOTIFICATION-CTRL";

@Riverpod(keepAlive: true)
Stream<int> notificationCount(Ref ref) async* {
  final user = ref.read(authCtrlProvider.notifier).user;

  final url = Uri.parse(
    AppBase.sseUrl,
  ).replace(path: "/sse/get_notification_count", queryParameters: {"user_id": "${user?.id}"});
  final sse = SSEService2(url: "$url");

  await sse.connect();

  final stream = sse.getStream;
  final data = stream.transform(_alertCountTransformer);
  data.listen((event) {
    logX("notificationCountListenerProvider : $event", name: _kLogName);
    // ref.read(notificationCountProvider.notifier).state = event;
  });
}

// Count notification
// final notificationCountListenerProvider = StreamProvider<int>((ref) async* {
//   final url = Uri.parse(
//     AppBase.sseUrl,
//   ).replace(path: "/sse/get_notification_count", queryParameters: {"user_id": "${ref.read(authUserProvider)?.id}"});
//   final sse = SSEService2(url: "$url");

//   await sse.connect();

//   final stream = sse.getStream;
//   final data = stream.transform(_alertCountTransformer);
//   data.listen((event) {
//     log("notificationCountListenerProvider : $event", name: _kLogName);
//     // ref.read(notificationCountProvider.notifier).state = event;
//   });
// });

// Fetch notification list
final fetchNotificationsProvider = FutureProvider<List<Alert>?>((ref) async {
  // TODO: fetchNotificationsProvider
  return;
});

// Transform SseMessage to number
StreamTransformer<SseMessage, int> _alertCountTransformer = StreamTransformer.fromHandlers(
  handleData: (data, sink) {
    try {
      if (data.data.isEmpty) {
        sink.add(0);
      } else {
        int count = data.data.toInt();
        sink.add(count);
      }
    } catch (e, st) {
      logE('Error', error: e, stackTrace: st, name: _kLogName);
    }
  },
);

@riverpod
NotificationCtrl notificationCtrl(Ref ref) => NotificationCtrl(ref);

class NotificationCtrl {
  final Ref ref;
  NotificationCtrl(this.ref) {
    initialize();
  }

  static const int _defaultShowReminderAfterRestartCount = 3;

  bool? showNotificationPermissionReminder;
  int? showReminderAfterRestartCount;

  void initialize() async {
    logX('Initialize Notification !');

    // ref.read(notificationCountListenerProvider);
    showNotificationPermissionReminder = ref.read(sharedPrefProvider).getBool('SHOW_NOTIFICATION_PERMISSION_REMINDER');
    if (showNotificationPermissionReminder == null) {
      showNotificationPermissionReminder = true;
      ref.read(sharedPrefProvider).setBool('SHOW_NOTIFICATION_PERMISSION_REMINDER', true);
    }

    showReminderAfterRestartCount = ref.read(sharedPrefProvider).getInt('SHOW_REMINDER_AFTER_RESTART_COUNT');
    if (showReminderAfterRestartCount == null) {
      showReminderAfterRestartCount = 1;
      ref.read(sharedPrefProvider).setInt('SHOW_REMINDER_AFTER_RESTART_COUNT', 1);
    }

    if (showNotificationPermissionReminder == false) {
      if (showReminderAfterRestartCount! >= _defaultShowReminderAfterRestartCount) {
        showNotificationPermissionReminder = true;
        ref.read(sharedPrefProvider).setBool('SHOW_NOTIFICATION_PERMISSION_REMINDER', true);
        ref.read(sharedPrefProvider).setInt('SHOW_REMINDER_AFTER_RESTART_COUNT', 1);
      } else {
        ref.read(sharedPrefProvider).setInt('SHOW_REMINDER_AFTER_RESTART_COUNT', showReminderAfterRestartCount! + 1);
      }
    }

    // ref.listen(authUserProvider, (previous, next) async {
    //   return ref.refresh(notificationCountListenerProvider);
    // });
    ref.notifyListeners();
  }

  void toggleShowReminder() {
    showNotificationPermissionReminder = !showNotificationPermissionReminder!;
    ref.read(sharedPrefProvider).setBool('SHOW_NOTIFICATION_PERMISSION_REMINDER', showNotificationPermissionReminder!);
    ref.notifyListeners();
  }

  void clear() {
    ref.read(sharedPrefProvider).remove('SHOW_NOTIFICATION_PERMISSION_REMINDER');
    ref.read(sharedPrefProvider).remove('SHOW_REMINDER_AFTER_RESTART_COUNT');
    showNotificationPermissionReminder = true;
    showReminderAfterRestartCount = 1;
    ref.notifyListeners();
  }

  Future create([Map<String, dynamic>? data]) async {
    // final url = Uri.parse(AppBase.apiUrl).replace(path: '/api/v1/notification/create').toString();
    // final state = await AsyncValue.guard(
    //   () async => await ref.read(dioTokenProvider(ref.read(authTokenProvider))).post(url, data: data),
    // );
    // return state.value?.data;

    final reqs = Reqs(path: '/api/v1/notification/create', data: data);
    final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

    if (state.hasError) return;
  }

  Future update([Map<String, dynamic>? data]) async {
    // final url = Uri.parse(AppBase.apiUrl).replace(path: '/api/v1/notification/update').toString();
    // final state = await AsyncValue.guard(
    //   () async => await ref.read(dioTokenProvider(ref.read(authTokenProvider))).post(url, data: data),
    // );
    // return state.value?.data;

    final reqs = Reqs(path: '/api/v1/notification/update', data: data);
    final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

    if (state.hasError) return;
  }

  Future delete([Map<String, dynamic>? data]) async {
    // final url = Uri.parse(AppBase.apiUrl).replace(path: '/api/v1/notification/delete').toString();
    // final state = await AsyncValue.guard(
    //   () async => await ref.read(dioTokenProvider(ref.read(authTokenProvider))).post(url, data: data),
    // );
    // return state.value?.data;

    final reqs = Reqs(path: '/api/v1/notification/delete', data: data);
    final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

    if (state.hasError) return;
  }
}
