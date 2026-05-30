import 'package:flutter/material.dart';
import 'package:amoora_mkt/cff/widgets/custom_appbar_background.dart';
import 'package:amoora_mkt/cff/utils/my_ui.dart';

class ParticipantView extends StatelessWidget {
  const ParticipantView({super.key});

  static const routeName = '/participant';

  @override
  Widget build(BuildContext context) {
    return MyUI(
      customAppBarBackground: CustomAppBarBackground(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          titleSpacing: 30,
          title: const Text('Peserta'),
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        body: Container(),
      ),
    );
  }
}
