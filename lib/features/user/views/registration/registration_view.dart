import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amoora_mkt/cff/widgets/custom_statusbar_background.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/features/user/controller/registration_ctrl.dart';
import 'package:amoora_mkt/cff/utils/my_ui.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

class RegistrationView extends ConsumerWidget {
  const RegistrationView({super.key});

  static const routeName = '/registration';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      customStatusBarBackground: CustomStatusBarBackground(),
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(color: oBlack),
          title: const Text('Pendaftaran').clr(oBlack),
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(preferredSize: Size.fromHeight(1), child: divider(thick: .5)),
        ),
        body: Container(
          color: oWhite,
          child: RefreshIndicator(
            onRefresh: () async {},
            child: ListView(
              children: [
                15.height,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Card(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final item = RegistrationType.values[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListTile(
                            title: Text(item.name).clr(primaryLight).bold(),
                            onTap: () => ref.read(registrationCtrlProvider).goto(item),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: divider()),
                      itemCount: RegistrationType.values.length,
                    ),
                  ),
                ),
                // Column(
                //   children: List.generate(RegistrationType.values.length, (index) {
                //     final item = RegistrationType.values[index];
                //     return ListTile(title: Text(item.name));
                //   }),
                // ),
                20.height,
                Padding(padding: const EdgeInsets.symmetric(horizontal: 30), child: Text('Artikel').tsTitle().bold()),
                10.height,
                // ArticleCard(),
                60.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
