import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/utils/darkmode_utils.dart';
import 'package:amoora_mkt/cff/utils/router.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

import '../../../controllers/media_picker_ctrl.dart';
import '../../../exceptions/warning_exeption.dart';
import '../../../widgets/button/custom_button.dart';
import 'album_list.dart';
import 'asset_card.dart';

class GalleryPicker extends ConsumerWidget {
  const GalleryPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAlbum = ref.watch(selectedAlbumProvider);
    final assetList = ref.watch(assetListProvider);

    if (ref.watch(albumListProvider).isEmpty) {
      return WarningException(
        title: 'Tidak ada gambar di galeri !',
        child: ElevatedButton(
          onPressed: () async => await ref.read(mediaPickerCtrlProvider).refresh(),
          child: const Text('Refresh'),
        ),
      );
    }

    if (selectedAlbum == null) {
      return Center(
        child: CustomButton(
          onPressed: () async => await ref.read(mediaPickerCtrlProvider).refresh(),
          child: const Text('Refresh'),
        ),
      );
    }

    if (assetList.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: false,
          floating: true,
          automaticallyImplyLeading: false,
          toolbarHeight: 50,
          expandedHeight: 50,
          backgroundColor: oWhite.whenDark(oBlack50),
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.fromLTRB(0, 12, 20, 12),
            title: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () async =>
                    await Navigator.push(context, MaterialPageRoute(builder: (context) => const AlbumList())),
                child: Text(
                  selectedAlbum.name.toLowerCase() == 'recent' ? 'Semua Media' : selectedAlbum.name,
                  style: tsBody().clr(oGreen),
                ),
              ),
            ),
          ),
        ),
        if (assetList.isNotEmpty)
          SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: assetList.length,
            itemBuilder: (context, index) {
              return AssetCard(
                assetEntity: assetList[index],
                onTap: () async {
                  var file = await ref.read(mediaPickerCtrlProvider).selectedAsset(assetList[index]);
                  return ref.read(goRouterProvider).pop(file);
                },
              );
            },
          ),
      ],
    );
  }
}
