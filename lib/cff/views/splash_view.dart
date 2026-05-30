import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/utils/my_ui.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

import '../controllers/init_ctrl.dart';
import '../widgets/logo.dart';
import '../widgets/skelton.dart';
import '../widgets/version_info.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  static const routeName = '/splash';

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      bool result = await ref.read(initCtrlProvider).initApps();
      if (result == false) {
        SystemNavigator.pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyUI(
      enabledSafeArea: false,
      customBackground: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pattern-01.png'),
            repeat: ImageRepeat.repeat,
            opacity: .7,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [primaryLight, const Color(0xFF03436B)],
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            // LOGO
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(width: 200, child: Logo(src: 'assets/icons/logo-amoora-white.png')),
                  ),
                ],
              ),
            ),
            // VERSION
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: context.screenHeight * .05),
                child: VersionInfo(color: oWhite),
              ),
            ),
            Align(alignment: Alignment.bottomCenter, child: Skelton(radius: 0)),
          ],
        ),
      ),
    );
  }
}
