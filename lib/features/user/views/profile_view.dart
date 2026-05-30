import 'package:amoora_mkt/features/auth/controller/auth_controller.dart';
import 'package:amoora_mkt/features/user/views/widgets/profile_authorized.dart';
import 'package:amoora_mkt/features/user/views/widgets/profile_unauthorized.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amoora_mkt/cff/widgets/custom_appbar_background.dart';
import 'package:amoora_mkt/cff/utils/my_ui.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authCtrlProvider).value;
    return MyUI(
      customAppBarBackground: CustomAppBarBackground(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(titleSpacing: 30, title: const Text('Profile'), backgroundColor: Colors.transparent),
        body: RefreshIndicator(
          onRefresh: () async {
            Future.value();
          },
          child: ListView(
            shrinkWrap: true,
            children: [
              if (user != null) ...[ProfileAuthorized()] else ...[ProfileUnauthorized()],
            ],
          ),
        ),
      ),
    );
  }
}
