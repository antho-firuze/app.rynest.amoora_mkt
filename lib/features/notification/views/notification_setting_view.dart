import 'package:amoora_mkt/cff/controllers/permission_ctrl.dart';
import 'package:amoora_mkt/cff/utils/my_ui.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationSettingView extends ConsumerWidget {
  const NotificationSettingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: Text('Setting Notifikasi')),
        body: RefreshIndicator(
          onRefresh: () async {},
          child: ListView(
            children: [
              ListTile(
                title: const Text('Aktifkan Notifikasi').bold(),
                trailing: Switch(
                  value: ref.watch(permissionCtrlProvider).allowNotification,
                  onChanged: (_) async => await ref.read(permissionCtrlProvider).requestNotificationPermission(),
                ),
              ),
              // ListTile(
              //   title: const Text('Notifikasi waktu sholat').bold(),
              //   subtitle: const Text('Aktifkan pemberitahuan untuk waktu sholat.').thin,
              //   trailing: Switch(
              //     value: ref.watch(alertPrayerScheduleProvider),
              //     onChanged: ref.watch(allowAlertProvider) == true
              //         ? (_) => ref.read(prayerTimesAlertProvider).alertPrayerSchedule()
              //         : null,
              //   ),
              // ),
              // // alertPrayerScheduleProvider
              // if (ref.watch(alertPrayerScheduleProvider)) ...[
              //   Padding(
              //     padding: const EdgeInsets.only(left: 20),
              //     child: ListTile(
              //       title: const Text('Subuh').bold(),
              //       trailing: Switch(
              //         value: ref.watch(alertSubuhProvider),
              //         onChanged:
              //             ref.watch(allowAlertProvider) ? (_) => ref.read(prayerTimesAlertProvider).alertSubuh() : null,
              //       ),
              //     ),
              //   ),
              //   Padding(
              //     padding: const EdgeInsets.only(left: 20),
              //     child: ListTile(
              //       title: const Text('Dzuhur').bold(),
              //       trailing: Switch(
              //         value: ref.watch(alertDzuhurProvider),
              //         onChanged: ref.watch(allowAlertProvider)
              //             ? (_) => ref.read(prayerTimesAlertProvider).alertDzuhur()
              //             : null,
              //       ),
              //     ),
              //   ),
              //   Padding(
              //     padding: const EdgeInsets.only(left: 20),
              //     child: ListTile(
              //       title: const Text('Ashar').bold(),
              //       trailing: Switch(
              //         value: ref.watch(alertAsharProvider),
              //         onChanged:
              //             ref.watch(allowAlertProvider) ? (_) => ref.read(prayerTimesAlertProvider).alertAshar() : null,
              //       ),
              //     ),
              //   ),
              //   Padding(
              //     padding: const EdgeInsets.only(left: 20),
              //     child: ListTile(
              //       title: const Text('Maghrib').bold(),
              //       trailing: Switch(
              //         value: ref.watch(alertMaghribProvider),
              //         onChanged: ref.watch(allowAlertProvider)
              //             ? (_) => ref.read(prayerTimesAlertProvider).alertMaghrib()
              //             : null,
              //       ),
              //     ),
              //   ),
              //   Padding(
              //     padding: const EdgeInsets.only(left: 20),
              //     child: ListTile(
              //       title: const Text('Isya').bold(),
              //       trailing: Switch(
              //         value: ref.watch(alertIsyaProvider),
              //         onChanged:
              //             ref.watch(allowAlertProvider) ? (_) => ref.read(prayerTimesAlertProvider).alertIsya() : null,
              //       ),
              //     ),
              //   ),
              // ],
              // ListTile(
              //   title: const Text('Notifikasi agenda kegiatan').bold(),
              //   subtitle: const Text('Kabarkan jika sudah masuk waktunya.').thin,
              //   trailing: Switch(
              //     value: ref.watch(alertItineraryProvider),
              //     onChanged:
              //         ref.watch(allowAlertProvider) ? (_) => ref.read(notificationCtrlProvider).alertItinerary : null,
              //   ),
              // ),
              // ListTile(
              //   title: const Text('Notifikasi saat keluar rombongan').bold(),
              //   subtitle: const Text('Kabarkan jika saya keluar dari rombongan.').thin,
              //   trailing: Switch(
              //     value: ref.watch(alertOutOfRangeProvider),
              //     onChanged:
              //         ref.watch(allowAlertProvider) ? (_) => ref.read(notificationCtrlProvider).alertOutOfRange : null,
              //   ),
              // ),
              // ListTile(
              //   title: const Text('Notifikasi live streaming').bold(),
              //   subtitle: const Text('Kabarkan jika nanti ada live streaming.').thin,
              //   trailing: Switch(
              //     value: ref.watch(alertLiveStreamingProvider),
              //     onChanged: ref.watch(allowAlertProvider)
              //         ? (_) => ref.read(notificationCtrlProvider).alertLiveStreaming
              //         : null,
              //   ),
              // ),
              // ListTile(
              //   title: const Text('Notifikasi pesan baru').bold(),
              //   trailing: Switch(
              //     value: ref.watch(alertNewMessageProvider),
              //     onChanged:
              //         ref.watch(allowAlertProvider) ? (_) => ref.read(notificationCtrlProvider).alertNewMessage : null,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
