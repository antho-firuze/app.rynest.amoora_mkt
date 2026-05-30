import 'package:amoora_mkt/cff/utils/page_utils.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';
import 'package:amoora_mkt/cff/views/about_view.dart';
import 'package:amoora_mkt/cff/views/contact_us_view.dart';
import 'package:amoora_mkt/cff/widgets/button/custom_button.dart';
import 'package:amoora_mkt/cff/widgets/custom_avatar.dart';
import 'package:amoora_mkt/cff/widgets/forms/group_list.dart';
import 'package:amoora_mkt/cff/widgets/version_info.dart';
import 'package:amoora_mkt/features/auth/views/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileUnauthorized extends StatelessWidget {
  const ProfileUnauthorized({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.height,
        CustomAvatar(size: 70),
        15.height,
        const Text("Anda belum login !").tsTitle().bold(),
        const Text("Silahkan login terlebih dahulu").tsLabel(),
        15.height,
        GroupList(
          children: [
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomButton(
            child: const Text('Masuk / Login'),
            onPressed: () => context.goto(page: const SignInView()),
          ),
        ),
        10.height,
        VersionInfo(),
      ],
    );
  }
}
