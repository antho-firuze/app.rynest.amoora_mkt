import 'package:amoora_mkt/cff/utils/darkmode_utils.dart';
import 'package:amoora_mkt/cff/widgets/custom_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/utils/my_ui.dart';
import 'package:amoora_mkt/cff/utils/orientation_utils.dart';
import 'package:amoora_mkt/cff/utils/router.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/button/custom_button.dart';

class WalkthroughView extends ConsumerStatefulWidget {
  const WalkthroughView({super.key});

  static const routeName = '/walkthrough';

  @override
  ConsumerState<WalkthroughView> createState() => _WalkthroughViewState();
}

class _WalkthroughViewState extends ConsumerState<WalkthroughView> {
  PageController controller = PageController();
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MyUI(
      enabledSafeArea: true,
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  currIndex = index;
                });
              },
              children: walks.map((walk) => BuildPage(walk: walk)).toList(),
            ),
            if (context.isLandscape)
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(
                        controller: controller,
                        count: walks.length,
                        effect: ExpandingDotsEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          dotColor: oGrey70,
                          activeDotColor: primaryLight.whenDark(oWhite, context),
                        ),
                      ),
                      if (currIndex < walks.length - 1)
                        Row(
                          children: [
                            CustomButton(
                              color: Colors.transparent,
                              onPressed: () => ref.read(goRouterProvider).go('/home'),
                              child: Text('Skip'),
                            ),
                            20.width,
                            CustomButton(
                              child: Text('Next'),
                              onPressed: () => controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linear,
                              ),
                            ),
                          ],
                        )
                      else
                        CustomButton(child: Text('Start'), onPressed: () => ref.read(goRouterProvider).go('/home')),
                    ],
                  ),
                ),
              ),
            if (!context.isLandscape)
              SizedBox.expand(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SmoothPageIndicator(
                      controller: controller,
                      count: walks.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        dotColor: oGrey70,
                        activeDotColor: primaryLight.whenDark(oWhite, context),
                      ),
                    ),
                    20.height,
                    if (currIndex < walks.length - 1)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            child: Text('Next'),
                            onPressed: () =>
                                controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.linear),
                          ),
                        ),
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            child: Text('Start'),
                            onPressed: () => ref.read(goRouterProvider).go('/home'),
                          ),
                        ),
                      ),
                    // 5.height,
                    if (currIndex != walks.length - 1)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            flat: true,
                            child: Text('Skip'),
                            onPressed: () => ref.read(goRouterProvider).go('/home'),
                          ),
                        ),
                      ),
                    10.height,
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class BuildPage extends StatelessWidget {
  const BuildPage({super.key, required this.walk});

  final Walk walk;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(child: walk.image, height: context.screenHeight / 2, width: double.infinity),
        // BackdropFilter(
        //   filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        //   child: Container(color: Colors.primaries[walk.index % Colors.primaries.length].withAlpha(0)),
        //   // child: Container(color: Colors.black.withValues(alpha: 0)),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [(context.screenHeight / 2).height, 20.height, walk.title, 10.height, walk.subTitle],
          ),
        ),
      ],
    );
  }
}

class Walk {
  final Widget title;
  final Widget subTitle;
  final Widget image;

  Walk(this.title, this.subTitle, this.image);
}

List walks = [
  Walk(
    Wrap(
      spacing: 4.0,
      runSpacing: 8.0,
      children: [
        Text('Selamat Datang di').tsTitle().bold(),
        Text('AMOORA').tsTitle().bold().clr(primaryLight),
        Text('Marketing').tsTitle().bold(),
      ],
    ),
    Text(
      'Halo, pelaku bisnis travel! Optimalkan pemasaran Anda, tarik lebih  banyak pelanggan, dan raih kesuksesan dengan solusi cerdas kami.',
    ).tsBody().clip(),
    Image.asset("assets/images/background-01.jpg", fit: BoxFit.cover),
  ),
  Walk(
    Text('Perjalanan Menuju Sukses Dimulai di Sini').tsTitle().bold().clip().clr(primaryLight),
    // Wrap(
    //   spacing: 4.0,
    //   runSpacing: 8.0,
    //   children: [
    //     Text(
    //       'Tingkatkan visibilitas dan penjualan bisnis Anda dengan alat pemasaran inovatif dari',
    //     ).tsBody(),
    //     Text('Amoora').tsBody().clr(primaryLight),
    //   ],
    // ),
    Builder(
      builder: (context) {
        return CustomRichText(
          TextSpan(
            children: [
              TextSpan(
                text: 'Tingkatkan visibilitas dan penjualan bisnis Anda dengan alat pemasaran inovatif dari',
                style: tsBody(context),
              ),
              TextSpan(text: ' '),
              TextSpan(text: 'Amoora', style: tsBody().bold().clr(primaryLight)),
            ],
          ),
        );
      },
    ),
    Image.asset("assets/images/background-02.jpg", fit: BoxFit.cover),
  ),
  Walk(
    Text('Marketing Cerdas untuk Industri Travel').tsTitle().bold().clr(primaryLight),
    Builder(
      builder: (context) {
        return CustomRichText(
          TextSpan(
            children: [
              TextSpan(text: 'Dengan', style: tsBody(context)),
              TextSpan(text: ' '),
              TextSpan(text: 'Amoora', style: tsBody().bold().clr(primaryLight)),
              TextSpan(text: ', '),
              TextSpan(
                text: 'Anda dapat membuat strategi pemasaran yang efektif dan menarik lebih banyak pelanggan.',
                style: tsBody(context),
              ),
            ],
          ),
        );
      },
    ),
    // Text(
    //   'Dengan Amoora, Anda dapat membuat strategi pemasaran yang efektif dan menarik lebih banyak pelanggan.',
    // ).tsBody().clip(),
    Image.asset("assets/images/background-03.jpg", fit: BoxFit.cover),
  ),
];
