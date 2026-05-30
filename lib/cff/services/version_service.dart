import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/utils/datetime_utils.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';
import 'package:super_icons/super_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html/parser.dart' show parse;

import '../widgets/button/custom_button.dart';
import '../widgets/custom_panel.dart';
import '../widgets/custom_rich_text.dart';
import 'dialog_service.dart';

class VersionService {
  final Ref ref;
  VersionService(this.ref);

  Future<bool> newVersionAvailable({
    String? iOSId,
    String? androidId,
    String? iOSAppStoreCountry,
    String? forceAppVersion,
  }) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    VersionInfo? versionInfo;
    if (Platform.isIOS) {
      versionInfo = await _getiOSStoreVersion(
        packageInfo,
        iOSId: iOSId,
        iOSAppStoreCountry: iOSAppStoreCountry,
        forceAppVersion: forceAppVersion,
      );
    } else if (Platform.isAndroid) {
      versionInfo = await _getAndroidStoreVersion(packageInfo, androidId: androidId, forceAppVersion: forceAppVersion);
    } else {
      throw Exception('The target platform "${Platform.operatingSystem}" is not yet supported by this package.');
    }

    // SHOW DIALOG
    if (versionInfo != null && versionInfo.canUpdate == true) {
      _showDialog(packageInfo: packageInfo, versionInfo: versionInfo);
      return true;
    }
    return false;
  }

  Future<VersionInfo?> fetchVersionInfo({
    String? iOSId,
    String? androidId,
    String? iOSAppStoreCountry,
    String? forceAppVersion,
  }) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // log("packageInfo : $packageInfo");
    if (Platform.isIOS) {
      return await _getiOSStoreVersion(
        packageInfo,
        iOSId: iOSId,
        iOSAppStoreCountry: iOSAppStoreCountry,
        forceAppVersion: forceAppVersion,
      );
    } else if (Platform.isAndroid) {
      return await _getAndroidStoreVersion(packageInfo, androidId: androidId, forceAppVersion: forceAppVersion);
    } else {
      throw Exception('The target platform "${Platform.operatingSystem}" is not yet supported by this package.');
    }
  }

  /// iOS info is fetched by using the iTunes lookup API, which returns a JSON document.
  Future<VersionInfo?> _getiOSStoreVersion(
    PackageInfo packageInfo, {
    String? iOSId,
    String? iOSAppStoreCountry,
    String? forceAppVersion,
  }) async {
    final id = iOSId ?? packageInfo.packageName;
    // final parameters = {"bundleId": id};
    Map<String, dynamic> parameters = {};

    /// programmermager:fix/issue-35-ios-failed-host-lookup
    if (id.contains('.')) {
      parameters['bundleId'] = id;
    } else {
      parameters['id'] = id;
    }

    parameters['timestamp'] = DateTime.now().millisecondsSinceEpoch.toString();

    if (iOSAppStoreCountry != null) {
      parameters.addAll({"country": iOSAppStoreCountry});
    }
    var uri = Uri.https("itunes.apple.com", "/lookup", parameters);

    // CHECK IF "forceAppVersion" is not null
    if (forceAppVersion != null) {
      return VersionInfo._(
        localVersion: _getCleanVersion(packageInfo.version),
        storeVersion: forceAppVersion,
        appStoreLink: uri.toString(),
        releaseNotes: 'Testing with Force App Version.',
      );
    }

    final dio = Dio();
    return await dio
        .getUri(uri)
        .then((res) {
          if (res.statusCode != 200) {
            throw Exception('[${res.statusCode}] Failed to query iOS App Store');
          }

          final jsonObj = jsonDecode(res.data);
          final List results = jsonObj['results'];
          if (results.isEmpty) {
            throw Exception('Can\'t find an app in the App Store with the id: $id');
          }

          return VersionInfo._(
            localVersion: _getCleanVersion(packageInfo.version),
            storeVersion: _getCleanVersion(forceAppVersion ?? jsonObj['results'][0]['version']),
            appStoreLink: jsonObj['results'][0]['trackViewUrl'],
            releaseNotes: jsonObj['results'][0]['releaseNotes'],
          );
        })
        .onError((error, stackTrace) => throw Exception(error.toString()));
  }

  /// Android info is fetched by parsing the html of the app store page.
  Future<VersionInfo?> _getAndroidStoreVersion(
    PackageInfo packageInfo, {
    String? androidId,
    String? forceAppVersion,
  }) async {
    final id = androidId ?? packageInfo.packageName;
    final uri = Uri.https("play.google.com", "/store/apps/details", {
      "id": id,
      "hl": "en_US",
      "timestamp": DateTime.now().millisecondsSinceEpoch.toString(),
    });

    final dio = Dio();
    return await dio
        .getUri(uri)
        .then((res) {
          if (res.statusCode != 200) {
            throw Exception('[${res.statusCode}] Can\'t find an app in the Play Store with the id: $id');
          }

          final doc = parse(res.data);

          // Title
          final title = doc.getElementsByTagName('span').firstWhere((e) => e.attributes['itemprop'] == 'name').text;
          // Image
          final image = doc
              .getElementsByTagName('img')
              .firstWhere((e) => e.attributes['itemprop'] == 'image')
              .attributes['src'];

          // Supports 1.2.3 (most of the apps) and 1.2.prod.3 (e.g. Google Cloud)
          final regexp = RegExp(r'\[\[\[\"(\d+\.\d+(\.[a-z]+)?(\.([^"]|\\")*)?)\"\]\]');
          final storeVersion = regexp.firstMatch(res.data)?.group(1);

          // Rating
          final regexRating = RegExp(r'starRating\S+\s\S+\s\S+\s\d.\d');
          final expCleanRating = RegExp(r'\d.\d');
          var rating = regexRating.firstMatch(res.data)?[0];
          rating = rating != null ? (expCleanRating.firstMatch(rating)?[0]) : null;

          // Download
          final regexDownload = RegExp(r'>\d+([B,K,M])?\+<');
          final expCleanDownload = RegExp(r'\d+([B,K,M])?\+');
          var download = regexDownload.firstMatch(res.data)?[0];
          download = download != null ? (expCleanDownload.firstMatch(download)?[0]) : null;

          // Size
          final regexSize = RegExp(r'\d+\s[KB,MB,GB]{2}');
          var size = regexSize.firstMatch(res.data)?[0];

          // Release Note
          final regexpRelease = RegExp(r'\[(null,)\[(null,)\"((\.[a-z]+)?(([^"]|\\")*)?)\"\]\]');
          final expRemoveSc = RegExp(r"\\u003c[A-Za-z]{1,10}\\u003e", multiLine: true, caseSensitive: true);
          final expRemoveQuote = RegExp(r"\\u0026quot;", multiLine: true, caseSensitive: true);
          final expRemoveSingleQuote = RegExp(r"\\u0026#39;", multiLine: true, caseSensitive: true);
          final expRemoveAmp = RegExp(r"\\u0026amp;", multiLine: true, caseSensitive: true);

          var releaseNotes = regexpRelease.firstMatch(res.data)?.group(3);
          releaseNotes = releaseNotes!
              .replaceAll(expRemoveSc, '\n')
              .replaceAll(expRemoveQuote, '"')
              .replaceAll(expRemoveSingleQuote, "'")
              .replaceAll(expRemoveAmp, "&");

          // Release Date
          final regexReleaseDate = RegExp(r'\[\["[A-Za-z]+\s\d+,\s\d+",\[');
          final extCleanDate = RegExp(r'[A-Za-z]+\s\d+,\s\d+');

          var releaseDate = regexReleaseDate.firstMatch(res.data)?[0];
          releaseDate = extCleanDate.firstMatch(releaseDate!)?[0];

          return VersionInfo._(
            localVersion: _getCleanVersion(packageInfo.version),
            storeVersion: _getCleanVersion(forceAppVersion ?? storeVersion ?? '0.0.0'),
            appStoreLink: uri.toString(),
            releaseNotes: releaseNotes,
            image: image,
            title: title,
            releaseDate: releaseDate?.toDateTime('MMM dd, yyyy'),
            rating: rating != null ? double.parse(rating) : null,
            download: download,
            size: size ?? '10 MB',
          );
        })
        .onError((error, stackTrace) => throw Exception(error.toString()));
  }

  /// This function attempts to clean local version strings so they match the MAJOR.MINOR.PATCH
  /// versioning pattern, so they can be properly compared with the store version.
  String _getCleanVersion(String version) => RegExp(r'\d+\.\d+\.\d+').stringMatch(version) ?? '0.0.0';

  /// Function for convert text
  /// _parseUnicodeToString
  String? _parseUnicodeToString(String? release) {
    try {
      if (release == null || release.isEmpty) return release;

      final re = RegExp(
        r'(%(?<asciiValue>[0-9A-Fa-f]{2}))'
        r'|(\\u(?<codePoint>[0-9A-Fa-f]{4}))'
        r'|.',
      );

      var matches = re.allMatches(release);
      var codePoints = <int>[];
      for (var match in matches) {
        var codePoint = match.namedGroup('asciiValue') ?? match.namedGroup('codePoint');
        if (codePoint != null) {
          codePoints.add(int.parse(codePoint, radix: 16));
        } else {
          codePoints += match.group(0)!.runes.toList();
        }
      }
      var decoded = String.fromCharCodes(codePoints);
      return decoded;
    } catch (e) {
      return release;
    }
  }

  // Dialog Promt
  void _showDialog({required PackageInfo packageInfo, required VersionInfo versionInfo}) {
    final icon = Platform.isIOS ? Icon(SuperIcons.mg_appstore_line) : Icon(SuperIcons.bs_google_play);
    // debugPrint(packageInfo.toString());
    debugPrint("storeVersion : ${versionInfo.storeVersion}");
    debugPrint("localVersion: ${versionInfo.localVersion}");
    debugPrint("appStoreLink : ${versionInfo.appStoreLink}");
    debugPrint("releaseNotes : ${versionInfo.releaseNotes}");

    debugPrint("image : ${versionInfo.image}");
    debugPrint("title : ${versionInfo.title}");
    debugPrint("releaseDate : ${versionInfo.releaseDate?.custom('MMM dd, yyyy')}");
    debugPrint("rating : ${versionInfo.rating}");
    debugPrint("download : ${versionInfo.download}");
    debugPrint("size : ${versionInfo.size}");

    DialogService(
      dismissable: false,
      leading: icon,
      title: Text('Update available'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomRichText(
            TextSpan(
              text: 'A new version of ',
              style: tsBody(),
              children: [
                TextSpan(text: '${versionInfo.title}', style: tsBody().bold()),
                TextSpan(text: ' is available!. Please update with the latest version.', style: tsBody()),
              ],
            ),
          ),
          10.height,
          if (Platform.isAndroid)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset('assets/icons/app-icon.png'),
              ),
              title: Text('${versionInfo.title}').tsTitle().bold(),
              subtitle: Row(
                children: [
                  if (versionInfo.rating != null)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('${versionInfo.rating}').tsBody(),
                        5.width,
                        Icon(Icons.star, size: 15, color: oGrey70),
                      ],
                    ),
                  if (versionInfo.download != null) ...[
                    20.width,
                    Row(
                      children: [
                        Text('${versionInfo.download}').tsBody(),
                        5.width,
                        Icon(Icons.arrow_downward, size: 15, color: oGrey70),
                      ],
                    ),
                  ],
                  if (versionInfo.size != null) ...[
                    20.width,
                    Row(
                      children: [
                        Text('${versionInfo.size}').tsBody(),
                        5.width,
                        Icon(Icons.download, size: 15, color: oGrey70),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          10.height,
          Text('New Version :').tsBody().bold(),
          Text(versionInfo.storeVersion),
          CustomPanel(
            title: Text("What's new :").tsBody().bold(),
            subtitle: versionInfo.releaseDate != null
                ? Text('Last updated ${versionInfo.releaseDate?.custom('MMM dd, yyyy')}')
                : null,
            content: Text('${versionInfo.releaseNotes}'),
          ),
        ],
      ),
      actions: [
        CustomButton(
          flat: true,
          onPressed: () async {
            if (await canLaunchUrl(Uri.parse(versionInfo.appStoreLink))) {
              await launchUrl(Uri.parse(versionInfo.appStoreLink));
            } else {
              throw Exception('Could not launch appStoreLink');
            }
          },
          child: Text('Learn more'),
        ),
        CustomButton(
          child: Text('Update'),
          onPressed: () async {
            // Navigator.of(rootNavigatorKey.currentContext!).pop();
            // await newVersionAvailable(forceAppVersion: '2.0.4');
            if (await canLaunchUrl(Uri.parse(versionInfo.appStoreLink))) {
              await launchUrl(Uri.parse(versionInfo.appStoreLink));
            } else {
              throw Exception('Could not launch appStoreLink');
            }
          },
        ),
      ],
      onPressed: print,
    ).show();
  }
}

final versionServiceProvider = Provider(VersionService.new);

class VersionInfo {
  VersionInfo._({
    required this.localVersion,
    required this.storeVersion,
    required this.appStoreLink,
    this.releaseNotes,
    this.image,
    this.title,
    this.releaseDate,
    this.rating,
    this.download,
    this.size,
  });
  final String localVersion;
  final String storeVersion;
  final String appStoreLink;
  final String? releaseNotes;
  final String? image;
  final String? title;
  final DateTime? releaseDate;
  final double? rating;
  final String? download;
  final String? size;

  bool get canUpdate {
    // REMOVE DOT (.)
    final storeStr = storeVersion.replaceAll(RegExp(r'[.]'), '');
    final localStr = localVersion.replaceAll(RegExp(r'[.]'), '');
    // PARSE TO DOUBLE
    double storeVer = double.tryParse(storeStr) ?? 0;
    double localVer = double.tryParse(localStr) ?? 0;

    return storeVer > localVer;
  }
}
