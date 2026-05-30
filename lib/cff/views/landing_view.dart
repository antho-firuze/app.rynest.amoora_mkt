import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/core/app_string.dart';
import 'package:amoora_mkt/cff/utils/my_ui.dart';
import 'package:amoora_mkt/cff/utils/orientation_utils.dart';
import 'package:amoora_mkt/cff/utils/page_utils.dart';
import 'package:amoora_mkt/cff/utils/router.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

import '../widgets/button/custom_button.dart';
import '../widgets/logo.dart';
import 'walkthrough_view.dart';

class LandingView extends ConsumerWidget {
  const LandingView({super.key});

  static const routeName = '/landing';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      enabledSafeArea: false,
      customBackground: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF484FB8), Color(0xFF2D316E)],
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            // LOGO & TITLE
            if (context.isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 200, child: Logo(src: 'assets/icons/logo-uniga.png')),
                  20.width,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Selamat Datang di Aplikasi ${AppString.appName} !").tsTitle().bold().clr(oWhite30),
                      10.height,
                      SizedBox(
                        width: context.screenWidth / 2,
                        child: Text(
                          'Kami dengan senang hati memperkenalkan platform digital kami yang dirancang khusus untuk memudahkan akses informasi dan layanan bagi seluruh aktivitas akademika.',
                        ).tsTitle().justify().clr(oWhite30),
                      ),
                    ],
                  ),
                ],
              )
            else
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 200, child: Logo(src: 'assets/icons/logo-uniga.png')),
                    100.height,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Selamat Datang di Aplikasi ${AppString.appName} !").tsTitle().bold().clr(oWhite30),
                        10.height,
                        Text(
                          'Kami dengan senang hati memperkenalkan platform digital kami yang dirancang khusus untuk memudahkan akses informasi dan layanan bagi seluruh aktivitas akademika.',
                        ).tsTitle().justify().clr(oWhite30),
                      ],
                    ),
                    100.height,
                  ],
                ),
              ),
            // NAVIGATOR
            SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: double.infinity.whenLandscape(300),
                      child: CustomButton(
                        child: Text('Get Started'),
                        onPressed: () => context.goto(page: WalkthroughView()),
                      ),
                    ),
                  ),
                  CustomButton(
                    color: Colors.transparent,
                    child: Text('Skip'),
                    onPressed: () => ref.read(goRouterProvider).go('/home'),
                  ),
                  10.whenLandscape(0)!.height,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
