import 'package:amoora_mkt/cff/controllers/permission_ctrl.dart';
import 'package:amoora_mkt/cff/utils/datetime_utils.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';
import 'package:amoora_mkt/cff/widgets/exceptions/data_exeception_widget.dart';
import 'package:amoora_mkt/features/notification/controller/notification_ctrl.dart';
import 'package:amoora_mkt/cff/utils/my_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationView extends ConsumerWidget {
  const NotificationView({super.key});

  static const routeName = '/notification';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      child: Scaffold(
        appBar: AppBar(
          // titleSpacing: 20,
          title: Text('Notifikasi'),
          actions: [
            IconButton(onPressed: () => ref.read(notificationCtrlProvider).clear(), icon: Icon(Icons.search)),
            // SettingsButton(onPressed: () => context.goto(page: const NotificationSettingView())),
            // SettingsButton(
            //   onPressed: ref.read(notificationCtrlProvider).goSettingPage,
            // ),
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(Icons.more_vert, color: oWhite.whenDark(oWhite)),
            // ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
          },
          child: Column(
            children: [
              if (ref.watch(permissionCtrlProvider).allowNotification == false)
                if (ref.watch(notificationCtrlProvider).showNotificationPermissionReminder == true)
                  NotificationPermissionWidget(),
              // EmptyNotificationWidget(),
              // Text(ref.watch(notificationProvider)).bold(),
              Expanded(
                child: Scrollbar(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Notifikasi ${index + 1}').bold(),
                        subtitle: Text('Ini adalah pesan untuk notifikasi $index'),
                        trailing: Text(DateTime.now().subtract(Duration(minutes: index * 5)).formatTimeAgo()),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationPermissionWidget extends ConsumerWidget {
  const NotificationPermissionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.yellow[100],
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.notifications_active_outlined),
          10.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Izinkan notifikasi untuk dapatkan update dan informasi terbaru!').tsBody(),
                Text('Izinkan').tsBody().link(
                  onTap: () async => await ref.read(permissionCtrlProvider).requestNotificationPermission(),
                ),
              ],
            ),
          ),
          InkWell(onTap: () => ref.read(notificationCtrlProvider).toggleShowReminder(), child: Icon(Icons.close)),
        ],
      ),
    );
  }
}

class EmptyNotificationWidget extends ConsumerWidget {
  const EmptyNotificationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(top: 8.whenLandscape(0)!),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image
          DataExceptionWidget(type: ExeceptionType.dataEmpty, title: 'Tidak ada notifikasi saat ini !'),
        ],
      ),
    );
  }
}
