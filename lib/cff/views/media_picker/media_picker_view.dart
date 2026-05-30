import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/utils/darkmode_utils.dart';
import 'package:amoora_mkt/cff/utils/my_ui.dart';

import '../../controllers/camera_ctrl.dart';
import '../../controllers/media_picker_ctrl.dart';
import '../../controllers/permission_ctrl.dart';
import '../../exceptions/warning_exeption.dart';
import 'widget/camera_picker.dart';
import 'widget/gallery_picker.dart';

class MediaPickerView extends ConsumerStatefulWidget {
  const MediaPickerView({super.key});

  @override
  ConsumerState<MediaPickerView> createState() => _PickImageViewState();
}

class _PickImageViewState extends ConsumerState<MediaPickerView> with SingleTickerProviderStateMixin {
  PageController pageController = PageController();
  late TabController tabController;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    tabController = TabController(length: 2, vsync: this);

    ref.read(cameraCtrlProvider).initialized();
    ref.read(mediaPickerCtrlProvider).initialized();

    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!ref.watch(permissionCtrlProvider).allowCameraAndMedia) {
      return MyUI(
        child: Scaffold(
          appBar: AppBar(title: Text('Pilih Gambar')),
          body: ListView(
            children: [
              WarningException(
                title: 'Izinkan akses Galery & Camera !',
                child: ElevatedButton(
                  onPressed: () async => await ref.read(mediaPickerCtrlProvider).getPermission(),
                  child: Text('Izinkan Akses'),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text('Pilih Gambar')),
        body: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (value) {
                tabController.animateTo(value);
              },
              children: const [GalleryPicker(), CameraPicker()],
            ),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 50,
          child: TabBar(
            controller: tabController,
            onTap: (value) =>
                pageController.animateToPage(value, duration: const Duration(milliseconds: 300), curve: Curves.ease),
            indicatorWeight: 3.0,
            indicatorColor: primaryLight.whenDark(secondaryLight),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Tab(child: Text('Gallery', textScaler: TextScaler.linear(.9))),
              Tab(child: Text('Camera', textScaler: TextScaler.linear(.9))),
            ],
          ),
        ),
      ),
    );
  }
}
