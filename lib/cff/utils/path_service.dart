import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

final pathServiceProvider = Provider(PathService.new);

class PathService {
  final Ref ref;
  PathService(this.ref);

  Future<String> getAppFileDirectory() async {
    // files
    return (await getApplicationSupportDirectory()).path;
  }

  Future<String> getAppCacheDirectory() async {
    String? directory;

    // cache
    directory ??= (await getTemporaryDirectory()).path;
    // directory ??= (await getApplicationCacheDirectory()).path;
    return directory;
  }

  Future<String?> getDownloadDirectory() async {
    String directory;
    if (Platform.isIOS) {
      directory = (await getDownloadsDirectory())?.path ??
          (await getTemporaryDirectory()).path;
    } else {
      directory = '/storage/emulated/0/Download/';
      var dirDownloadExists = true;
      dirDownloadExists = await Directory(directory).exists();
      if (!dirDownloadExists) {
        directory = '/storage/emulated/0/Downloads/';
        dirDownloadExists = await Directory(directory).exists();
        if (!dirDownloadExists) {
          directory = (await getTemporaryDirectory()).path;
        }
      }
    }
    return directory;
  }
}
