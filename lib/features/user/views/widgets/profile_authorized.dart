import 'package:amoora_mkt/cff/utils/page_utils.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';
import 'package:amoora_mkt/cff/views/about_view.dart';
import 'package:amoora_mkt/cff/views/contact_us_view.dart';
import 'package:amoora_mkt/cff/widgets/button/custom_button.dart';
import 'package:amoora_mkt/cff/widgets/custom_avatar.dart';
import 'package:amoora_mkt/cff/widgets/forms/group_list.dart';
import 'package:amoora_mkt/cff/widgets/version_info.dart';
import 'package:amoora_mkt/features/auth/controller/auth_controller.dart';
import 'package:amoora_mkt/features/auth/views/pwd_change_view.dart';
import 'package:amoora_mkt/features/auth/views/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileAuthorized extends ConsumerWidget {
  const ProfileAuthorized({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authCtrlProvider).value;
    return Column(
      children: [
        25.height,
        CustomAvatar(size: 70),
        15.height,
        Text("${user?.name}").tsTitle().bold(),
        Text("${user?.email}").tsLabel(),
        GroupList(
          children: [
            GroupList(
              children: [
                ListTile(
                  leading: const Icon(SuperIcons.is_box_2_outline),
                  title: const Text('Profil').bold(),
                  onTap: () => context.goto(page: Container()),
                ),
                // ListTile(
                //   leading: const Icon(SuperIcons.is_personalcard_outline),
                //   title: const Text('Foto KTP').bold(),
                //   onTap: () => context.goto(page: Container()),
                // ),
                // ListTile(
                //   leading: const Icon(SuperIcons.is_cards_outline),
                //   title: const Text('Foto Ujian').bold(),
                //   onTap: () => context.goto(page: Container()),
                // ),
              ],
            ),
            10.height,
            GroupList(
              children: [
                ListTile(
                  leading: const Icon(SuperIcons.is_password_check_outline),
                  title: const Text('Ubah Password').bold(),
                  onTap: () => context.goto(page: const PwdChangeView()),
                ),
              ],
            ),
            10.height,
            ListTile(
              leading: const Icon(SuperIcons.is_support_outline),
              title: const Text('Hubungi Kami').bold(),
              onTap: () => context.goto(page: const ContactUsView()),
            ),
            ListTile(
              leading: const Icon(SuperIcons.is_lamp_1_outline),
              title: const Text('Tentang Kami').bold(),
              onTap: () => context.goto(page: const AboutView()),
            ),
            ListTile(
              leading: const Icon(SuperIcons.is_security_safe_outline),
              title: const Text('Kebijakan Privasi').bold(),
              onTap: () => launchUrl(Uri.parse('https://amooratravel.com/kebijakan-privasi')),
            ),
          ],
        ),
        30.height,
        Consumer(
          builder: (context, ref, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                onPressed: () async {
                  final result = await ref.read(authCtrlProvider.notifier).signOut();
                  if (result) {
                    final result2 = await await ref.read(pageUtilsProvider).goto(page: SignInView(canPop: false));
                    if (result2 == false) {
                      SystemNavigator.pop();
                    }
                  }
                },
                child: const Text('Keluar / Logout'),
              ),
            );
          },
        ),
        10.height,
        VersionInfo(),
      ],
    );
  }
}
