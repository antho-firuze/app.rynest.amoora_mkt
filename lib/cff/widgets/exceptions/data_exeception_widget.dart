import 'package:amoora_mkt/cff/controllers/network_ctrl.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/utils/darkmode_utils.dart';
import 'package:amoora_mkt/cff/utils/log_utils.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

enum ExeceptionType {
  unknown('Unknown, probably data format not correct'),
  noInternet('Koneksi internet anda terganggu'),
  timeOut('Koneksi internet tidak stabil'),
  serverFailed('Server or Host has failed (down/busy)'),
  dataEmpty('Data belum tersedia');

  const ExeceptionType(this.title);
  final String title;
}

final exceptionProvider = Provider.family<ExeceptionType, Object?>((ref, error) {
  if (ref.read(networkCtrlProvider).isConnected == false) {
    return ExeceptionType.noInternet;
  } else {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return ExeceptionType.timeOut;
        case DioExceptionType.badCertificate:
        case DioExceptionType.badResponse:
        case DioExceptionType.cancel:
        case DioExceptionType.connectionError:
          return ExeceptionType.serverFailed;
        case DioExceptionType.unknown:
          return ExeceptionType.unknown;
      }
    } else {
      return ExeceptionType.unknown;
    }
  }
});

class DataExceptionWidget extends ConsumerWidget {
  const DataExceptionWidget({
    super.key,
    this.title,
    this.child,
    this.foregroundColor = oBlack,
    this.onTap,
    this.error,
    this.type,
  });

  final String? title;
  final Widget? child;
  final Color foregroundColor;
  final Function()? onTap;
  final Object? error;
  final ExeceptionType? type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errType = type ?? ref.read(exceptionProvider(error));
    logE('ERROR : ${errType!.title}', error: error, name: 'EXCEPTION-LAYOUT');
    return child ??
        ExceptionLayout(
          image: '',
          message: errType.title,
          foregroundColor: foregroundColor,
          reload: 'Reload',
          onTap: onTap,
        );
  }
}

class ExceptionLayout extends StatelessWidget {
  const ExceptionLayout({
    super.key,
    this.image = '',
    this.message = 'Data belum tersedia !',
    this.reload = 'Reload',
    this.foregroundColor = oBlack,
    this.onTap,
  });

  final String image;
  final String message;
  final String reload;
  final Color foregroundColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 10,
        children: [
          if (image.isNotEmpty) Image.asset(image, width: context.screenWidthRatio(.5, .3)),
          Text(message).tsTitle().center().clr(foregroundColor.withAlpha(150).whenDark(null)),
          GestureDetector(
            onTap: onTap,
            child: Opacity(
              opacity: .5,
              child: Column(
                children: [
                  Icon(
                    SuperIcons.is_refresh_2_bold,
                    size: 40,
                    color: onTap == null ? oGrey : foregroundColor.whenDark(null),
                  ),
                  Text(reload).clr(onTap == null ? oGrey : foregroundColor.whenDark(null)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
