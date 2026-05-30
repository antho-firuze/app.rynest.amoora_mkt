import 'package:amoora_mkt/cff/utils/ui_helper.dart';
import 'package:amoora_mkt/features/notification/views/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class ListNotification extends StatelessWidget {
  const ListNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.only(left: 16, top: 8), child: Text('Terbaru').tsTitle()),
        ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: const [
            CustomListTile(topic: 'Info', message: 'Proposalmu sedang di review!', date: '1 jam'),
            CustomListTile(topic: 'Info', message: 'Ayo lengkapi data penghargaan yang kamu punya!', date: '2 jam'),
            CustomListTile(topic: 'Info', message: 'Apakah saat ini kamu masih pelajar?', date: '3 jam'),
          ],
        ),
      ],
    );
  }
}
