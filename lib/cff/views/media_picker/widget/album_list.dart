import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amoora_mkt/cff/utils/router.dart';

import '../../../controllers/media_picker_ctrl.dart';

class AlbumList extends ConsumerWidget {
  const AlbumList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumList = ref.watch(albumListProvider);
    return Scaffold(
      body: ListView.builder(
        itemCount: albumList.length,
        itemBuilder: (BuildContext context, int index) {
          var item = albumList[index];
          return ListTile(
            onTap: () async {
              await ref.read(mediaPickerCtrlProvider).loadAssets(item);
              ref.read(goRouterProvider).pop();
            },
            title: Text(item.name.toLowerCase() == 'recent' ? 'Semua Media' : item.name),
            subtitle: FutureBuilder(
              future: item.assetCountAsync,
              initialData: 0,
              builder: (context, snapshot) => Text('${snapshot.data} foto'),
            ),
          );
        },
      ),
    );
  }
}
