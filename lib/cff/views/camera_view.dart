import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/utils/my_ui.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

import '../controllers/camera_ctrl.dart';
import '../controllers/permission_ctrl.dart';
import '../exceptions/warning_exeption.dart';
import '../widgets/button/custom_button.dart';
import '../widgets/button/custom_iconbutton.dart';

class CameraView extends ConsumerStatefulWidget {
  const CameraView({super.key});

  @override
  ConsumerState<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends ConsumerState<CameraView> {
  bool showFocusCircle = false;
  double x = 0;
  double y = 0;
  late Size size;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    ref.read(cameraCtrlProvider).initialized();
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
    size = MediaQuery.of(context).size;
    ref.watch(refreshCameraProvider);

    if (!ref.watch(permissionCtrlProvider).allowCameraAndMedia) {
      return MyUI(
        child: Scaffold(
          appBar: AppBar(title: Text('Ambil Gambar')),
          body: ListView(
            children: [
              WarningException(
                title: 'Izinkan akses Galery & Camera !',
                child: ElevatedButton(
                  onPressed: () async => await ref.read(cameraCtrlProvider).getPermission(),
                  child: Text('Izinkan Akses'),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (ref.read(cameraCtrlProvider).controller == null) {
      return Center(
        child: CustomButton(
          onPressed: () async => await ref.read(cameraCtrlProvider).getPermission(),
          child: const Text('Refresh'),
        ),
      );
    }

    if (ref.read(cameraCtrlProvider).controller?.value.isInitialized == false) {
      return const Center(child: CircularProgressIndicator());
    }

    if (ref.read(cameraCtrlProvider).controller?.value.isInitialized == false &&
        ref.read(cameraCtrlProvider).controller!.cameraId >= 0) {
      return const Center(child: CircularProgressIndicator());
    }

    if (ref.read(cameraCtrlProvider).cameras.isEmpty) {
      return Center(child: const Text('No Camera Available !').tsHeadline());
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Ambil Gambar')),
      body: Stack(
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: 1,
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: ClipRect(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: ref.read(cameraCtrlProvider).controller?.value.previewSize?.height,
                          height: ref.read(cameraCtrlProvider).controller?.value.previewSize?.width,
                          child: GestureDetector(
                            // onTapUp: (details) async => await onCameraTap(context, details),
                            child: CameraPreview(ref.read(cameraCtrlProvider).controller!),
                          ),
                        ),
                      ),
                    ),
                  ),
                  flashButton(),
                  captureButton(),
                  switchButton(),
                  if (showFocusCircle) focusCircle(),
                  if (ref.watch(cameraFileProvider) != null) preview(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  preview() {
    return Stack(
      children: [
        Center(
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: ref.read(cameraCtrlProvider).controller?.value.previewSize?.height,
                      height: ref.read(cameraCtrlProvider).controller?.value.previewSize?.width,
                      child: Image.file(File(ref.read(cameraFileProvider)!.path), fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIconButton(
                          padding: const EdgeInsets.all(4),
                          icon: const Icon(Icons.save, color: oWhite, size: 35),
                          onPressed: () async => await ref.read(cameraCtrlProvider).save(),
                        ),
                        CustomIconButton(
                          padding: const EdgeInsets.all(4),
                          icon: const Icon(Icons.close, color: oWhite, size: 35),
                          onPressed: () {
                            ref.read(cameraFileProvider.notifier).state = null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  flashButton() {
    if (ref.read(cameraLensProvider.notifier).state == CameraLensDirection.front) {
      return Container();
    }
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, left: 10),
        child: CustomIconButton(
          padding: const EdgeInsets.all(4),
          tooltip: 'Mode Flash',
          icon: Icon(ref.watch(flashIconProvider), size: 35, color: oWhite),
          onPressed: () async => ref.read(cameraCtrlProvider).flashMode(),
        ),
      ),
    );
  }

  captureButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CustomIconButton(
          tooltip: 'Ambil Gambar',
          icon: const Icon(Icons.camera, size: 50, color: oWhite),
          onPressed: () async => ref.read(cameraCtrlProvider).capture(),
        ),
      ),
    );
  }

  switchButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 10),
        child: CustomIconButton(
          padding: const EdgeInsets.all(4),
          tooltip: 'Ganti Kamera',
          icon: const Icon(Icons.cameraswitch, size: 35, color: oWhite),
          onPressed: () async => ref.read(cameraCtrlProvider).switchCamera(),
        ),
      ),
    );
  }

  Future<void> onCameraTap(BuildContext context, TapUpDetails details) async {
    if (ref.read(cameraCtrlProvider).controller!.value.isInitialized != true) return;
    if (ref.read(cameraCtrlProvider).lens == CameraLensDirection.front) return;

    // Size size = MediaQuery.of(context).size;

    x = details.localPosition.dy;
    y = details.localPosition.dx;

    // x = x / size.width;
    // y = size.height - size.width - kToolbarHeight - details.localPosition.dy;
    // y = details.localPosition.dy - 130;
    // Size? psize = ref.read(cameraCtrlProvider).controller!.value.previewSize;
    // log('pHeight: ${psize?.height}, pWidth: ${psize?.width}');

    // double aspectRatio = ref.read(cameraCtrlProvider).controller!.value.;
    // log('aspec: $aspectRatio');

    // // log('x/width = $x/${size.width} = ${x / size.width}');
    // log('y: ${details.localPosition.dy}, height: ${size.height}, width: ${size.width}, toolbar: $kToolbarHeight ===> $y');

    setState(() {
      ref.read(cameraCtrlProvider).controller?.setFocusPoint(Offset(x, y));
      ref.read(cameraCtrlProvider).controller?.setExposurePoint(Offset(x, y));
      // ref.read(cameraCtrlProvider).controller?.setFocusPoint(Offset(x / size.width, y / size.height));
      // ref.read(cameraCtrlProvider).controller?.setExposurePoint(Offset(x / size.width, y / size.height));
      showFocusCircle = true;

      Future.delayed(const Duration(seconds: 2)).whenComplete(() {
        setState(() {
          showFocusCircle = false;
        });
      });
    });
  }

  focusCircle() {
    return Positioned(
      top: y,
      left: x,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1.5),
        ),
      ),
    );
  }
}

class Paint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.grey.withOpacity(0.8), BlendMode.dstOut);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CardClip extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, size.height / 5, size.width, size.height / 2 + 60),
          const Radius.circular(0),
        ),
      );
    return path;
  }

  @override
  bool shouldReclip(oldClipper) {
    return true;
  }
}
