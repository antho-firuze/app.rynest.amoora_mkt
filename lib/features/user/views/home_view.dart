import 'package:amoora_mkt/cff/controllers/permission_ctrl.dart';
import 'package:amoora_mkt/cff/utils/page_utils.dart';
import 'package:amoora_mkt/cff/widgets/logo/app_logo.dart';
import 'package:amoora_mkt/features/auth/controller/auth_controller.dart';
import 'package:amoora_mkt/features/notification/views/notification_view.dart';
import 'package:amoora_mkt/features/user/views/widgets/product_widget.dart';
import 'package:amoora_mkt/features/user/views/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:super_icons/super_icons.dart';
import 'package:amoora_mkt/cff/widgets/button/custom_iconbutton.dart';
import 'package:amoora_mkt/cff/widgets/custom_avatar.dart';
import 'package:amoora_mkt/cff/widgets/one_ui/one_ui_nested_scroll_view.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/features/user/views/widgets/menu_widget.dart';
import 'package:amoora_mkt/cff/utils/my_ui.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  static const routeName = '/home';

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(permissionCtrlProvider).initialize();
    });
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        ref.read(permissionCtrlProvider).initialize();
      });
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authCtrlProvider).value;
    return MyUI(
      enabledSafeArea: false,
      child: Scaffold(
        body: OneUINestedScrollView(
          automaticallyImplyLeading: false,
          // expandedHeight: 100,
          // tollbarHeight: 100,
          background: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/background-01.jpg'), fit: BoxFit.cover),
            ),
          ),
          actions: [
            CustomIconButton(
              icon: Icon(SuperIcons.cl_bell_line, color: oWhite),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              color: primaryDark.withAlpha(130),
              hasNotif: true,
              onPressed: () => context.goto(page: NotificationView()),
            ),
          ],
          expandedWidget: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SafeArea(
                    top: true,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Row(
                        children: [
                          CustomAvatar(onTap: () => context.go('/profile')),
                          10.width,
                          Expanded(
                            child: GestureDetector(
                              onTap: () => context.go('/profile'),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Selamat Datang!').tsLabel().clr(Colors.white70),
                                  2.height,
                                  Text('${user?.name ?? "Guest"}').tsTitle().bold().ellipsis().clr(oWhite),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Center(child: AppLogo(height: 35, color: oGold)),
            ],
          ),
          collapsedWidget: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [AppLogo(height: 25, color: oGold)],
          ),
          onRefresh: () async => Future.value(),
          // onRefresh: () async => ref.refresh(fetchArticleListProvider),
          sliverList: SliverList.list(
            children: [
              20.height,
              // SEARCHING
              SearchWidget(),
              30.height,
              // CAROUSEL
              // CarouselWidget(items: CarouselItems.values, autoPlay: true),
              // 30.height,
              // MENU
              MenuWidget(),
              30.height,
              // ARTICLE
              // Padding(padding: const EdgeInsets.symmetric(horizontal: 30), child: Text('Artikel').tsTitle().bold()),
              // PACKAGE
              ProductWidget(),
              10.height,
              60.height,
            ],
          ),
        ),
      ),
    );
  }
}
