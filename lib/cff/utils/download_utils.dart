import 'dart:developer';
import 'dart:io';

import 'package:amoora_mkt/cff/models/reqs.dart';
import 'package:amoora_mkt/cff/utils/log_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import 'dio_service.dart';
import 'path_service.dart';

final fetchImageProvider = FutureProvider.autoDispose.family<String, Reqs>(
  (ref, arguments) async =>
      await ref.read(downloadUtilsProvider).downloadAndSaveImage(arguments.url!, arguments.fileKey),
);

class DownloadUtils {
  final Ref ref;
  DownloadUtils(this.ref);

  final _kLogName = "DOWNLOAD-UTILS";

  Future<String> saveAssetOnDisk(ImageProvider image, String fileName) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String filePath = '${directory.path}/$fileName';
    File newFile = File(filePath);

    if (!await newFile.exists()) {
      // BitmapHelper bitmapHelper = await BitmapHelper.fromImageProvider(image);
      // await newFile.writeAsBytes(bitmapHelper.content);
    }

    return filePath;
  }

  Future deleteImageOndisk(String fileName, {bool showLog = true}) async {
    try {
      var directory = await ref.read(pathServiceProvider).getAppFileDirectory();
      var file = File('$directory/$fileName');

      if (await file.exists()) {
        if (showLog) logX('deleteImageOndisk [file.path] : ${file.path}', name: _kLogName);
        await file.delete();
      } else {
        if (showLog) logX('deleteImageOndisk [$fileName] : not exist !', name: _kLogName);
      }
    } catch (e) {
      logE("Error: deleteImageOndisk", error: e, name: _kLogName);
      rethrow;
    }
  }

  Future<String> downloadAndSaveImage(String repoUrl, String fileName, {bool showLog = false}) async {
    try {
      var directory = await ref.read(pathServiceProvider).getAppFileDirectory();
      var file = File('$directory/$fileName');

      if (await file.exists()) {
        if (showLog) logX('downloadAndSaveImage [file.path] : ${file.path}', name: _kLogName);
        return file.path;
      }

      if (showLog) logX('downloadAndSaveImage [$fileName] : downloading...!', name: _kLogName);
      final url = Uri.parse(repoUrl);
      final response = await ref.read(dioFileDownloadProvider).getUri(url, onReceiveProgress: showDownloadProgress);

      if (response.statusCode != 200) {
        throw Exception('Image not available !');
      }

      var fo = file.openSync(mode: FileMode.write);
      fo.writeFromSync(response.data);
      await fo.close();
      if (showLog) logX('downloadAndSaveImage [$fileName] : download complete !', name: _kLogName);
      return file.path;
    } catch (e, st) {
      if (e is DioException) {
        final errCode = e.response?.statusCode;
        final errMsg = e.response?.statusMessage;

        logE("[$errCode] $errMsg", error: e, stackTrace: st, name: _kLogName);
      } else {
        logE("Error: downloadAndSaveImage", error: e, stackTrace: st, name: _kLogName);
      }
      rethrow;
    }

    // var directory = await ref.read(pathServiceProvider).getAppFileDirectory();
    // var file = File('$directory/$fileName');

    // if (await file.exists()) {
    //   log(':: downloadAndSaveImage => file.exists : ${file.path}');
    //   return file.path;
    // }

    // final url = Uri.parse(repoUrl);

    // return await ref
    //     .read(dioFileDownloadProvider)
    //     .getUri(
    //       url,
    //       // onReceiveProgress: (count, total) => log("Download $fileName: ${(count / total * 100).toStringAsFixed(0)} %"),
    //     )
    //     .then((res) async {
    //   if (res.statusCode == 200) {
    //     // log('===> downloadAndSaveFile ===> get from repo !');
    //     var fo = file.openSync(mode: FileMode.write);
    //     fo.writeFromSync(res.data);
    //     await fo.close();
    //     log(':: downloadAndSaveImage => completed : ${file.path}');
    //     return file.path;
    //   } else {
    //     var errString = 'Image not available !';
    //     return Future.error(errString);
    //   }
    // }).onError((error, stackTrace) => Future.error(error!));
  }

  // Future<String> downloadAndSaveFile(String url, String fileName) async {
  //   var directory = await ref.read(pathServiceProvider).getAppFileDirectory();
  //   // var directory = await getApplicationDocumentsDirectory();
  //   var filePath = '$directory/$fileName';
  //   var file = File(filePath);

  //   if (await file.exists()) {
  //     log('===> filePath ===> $filePath');
  //     return filePath;
  //   }

  //   try {
  //     // var response = await http.get(Uri.parse(url));
  //     // await file.writeAsBytes(response.bodyBytes);
  //     var response = await ref.read(dioProvider).getUri(
  //           Uri.parse(url),
  //           options: ref.read(dioOptionBytesProvider),
  //           // onReceiveProgress: showDownloadProgress,
  //         );
  //     if (response.statusCode == 200) {
  //       var fo = file.openSync(mode: FileMode.write);
  //       fo.writeFromSync(response.data);
  //       await fo.close();
  //       return filePath;
  //     }
  //     return '';
  //   } catch (e) {
  //     log(e.toString());
  //     return '';
  //   }
  // }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      log((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  // Future<String> _getDownloadPath() async {
  //   String directory;
  //   if (Platform.isIOS) {
  //     directory = (await getDownloadsDirectory())?.path ??
  //         (await getTemporaryDirectory()).path;
  //   } else {
  //     directory = '/storage/emulated/0/Download/';
  //     var dirDownloadExists = true;
  //     dirDownloadExists = await Directory(directory).exists();
  //     if (!dirDownloadExists) {
  //       directory = '/storage/emulated/0/Downloads/';
  //       dirDownloadExists = await Directory(directory).exists();
  //       if (!dirDownloadExists) {
  //         directory = (await getTemporaryDirectory()).path;
  //       }
  //     }
  //   }
  //   return directory;
  // }
}

String fileSize(dynamic size, [int round = 2]) {
  /**
   * [size] can be passed as number or as string
   *
   * the optional parameter [round] specifies the number
   * of digits after comma/point (default is 2)
   */
  int divider = 1024;
  // ignore: no_leading_underscores_for_local_identifiers
  int _size;
  try {
    _size = int.parse(size.toString());
  } catch (e) {
    throw ArgumentError("Can not parse the size parameter: $e");
  }

  if (_size < divider) {
    return "$_size B";
  }

  if (_size < divider * divider && _size % divider == 0) {
    return "${(_size / divider).toStringAsFixed(0)} KB";
  }

  if (_size < divider * divider) {
    return "${(_size / divider).toStringAsFixed(round)} KB";
  }

  if (_size < divider * divider * divider && _size % divider == 0) {
    return "${(_size / (divider * divider)).toStringAsFixed(0)} MB";
  }

  if (_size < divider * divider * divider) {
    return "${(_size / divider / divider).toStringAsFixed(round)} MB";
  }

  if (_size < divider * divider * divider * divider && _size % divider == 0) {
    return "${(_size / (divider * divider * divider)).toStringAsFixed(0)} GB";
  }

  if (_size < divider * divider * divider * divider) {
    return "${(_size / divider / divider / divider).toStringAsFixed(round)} GB";
  }

  if (_size < divider * divider * divider * divider * divider && _size % divider == 0) {
    num r = _size / divider / divider / divider / divider;
    return "${r.toStringAsFixed(0)} TB";
  }

  if (_size < divider * divider * divider * divider * divider) {
    num r = _size / divider / divider / divider / divider;
    return "${r.toStringAsFixed(round)} TB";
  }

  if (_size < divider * divider * divider * divider * divider * divider && _size % divider == 0) {
    num r = _size / divider / divider / divider / divider / divider;
    return "${r.toStringAsFixed(0)} PB";
  } else {
    num r = _size / divider / divider / divider / divider / divider;
    return "${r.toStringAsFixed(round)} PB";
  }
}

final downloadUtilsProvider = Provider(DownloadUtils.new);
