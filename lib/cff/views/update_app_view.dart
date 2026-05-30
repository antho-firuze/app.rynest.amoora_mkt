import 'package:flutter/material.dart';
import 'package:amoora_mkt/cff/utils/my_ui.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

import '../widgets/logo/app_logo.dart';

class UpdateAppView extends StatelessWidget {
  const UpdateAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyUI(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              // Logo
              const AppLogo(),
              30.height,
              Text('Perbarui ke Versi Terbaru').tsTitle().bold(),
              10.height,
              Text('Agar aktivitas Anda di Amoora tetap lancar, yuk update ke versi terbaru !'),
              40.height,
              ElevatedButton(onPressed: () {}, child: const Text('Perbarui Sekarang')),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
