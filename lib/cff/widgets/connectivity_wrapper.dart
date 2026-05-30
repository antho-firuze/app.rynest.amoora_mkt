import 'package:amoora_mkt/cff/controllers/network_ctrl.dart';
import 'package:amoora_mkt/cff/widgets/overlay_container.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectivityWrapper extends ConsumerWidget {
  const ConnectivityWrapper({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isShowOverlay = ref.watch(networkCtrlProvider).isConnected == false;

    return Stack(
      children: [
        child ?? const SizedBox(),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OverlayContainer(
              isShowOverlay: isShowOverlay,
              backgroundColor: oRed.withOpacity(.8),
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.wifi_off, color: oWhite),
                    10.width,
                    Text('Koneksi internet anda terganggu !', style: ts.clr(oWhite)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
