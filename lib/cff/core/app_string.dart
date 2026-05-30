/// Contains all the strings used accross the app.
/// Avoid hard coding strings.
/// All the strings must be added in this file.
/// ```dart
/// class AppStrings{
///  static const appName = "My App";
///}
///```
library;

class AppString {
  static const appName = "AMOORA Marketing";
  static const pageMessage = "Pesan";
  static const pageAlert = "Notifikasi";
  static const pageProfile = "Profil";
  static const pageHome = "Home";
}

class FailureMessage {
  static const getRequestMessage = "GET REQUEST FAILED";
  static const postRequestMessage = "POST REQUEST FAILED";
  static const putRequestMessage = "PUT REQUEST FAILED";
  static const deleteRequestMessage = "DELETE REQUEST FAILED";

  static const jsonParsingFailed = "FAILED TO PARSE JSON RESPONSE";

  static const authTokenEmpty = "AUTH TOKEN EMPTY";
}

class LogLabel {
  static const product = "PRODUCT";
  static const auth = "AUTH";
  static const httpGet = "HTTP/GET";
  static const httpPost = "HTTP/POST";
  static const httpPut = "HTTP/PUT";
  static const httpDelete = "HTTP/DELETE";
  static const sharedPrefs = "SHARED_PREFERENCES";
}

class PermissionString {
  static const gpsEnabled = "Location services enabled";
  static const gpsDisabled =
      "Location services disabled. App will not be able to detect your location. App features will not work. If you have used the app before, last location will be used.";

  static const locationAllowed = "Location permission allowed";
  static const locationDisallowed =
      "Location permission is required. App feature will not work. If you have used the app before, last location will be used.";

  static const batteryOptzInclude =
      "To avoid problems with prayer notifications and widgets updates, please exclude the app from battery optimization in your device settings.";
  static const batteryOptzExclude = "App is excluded from battery optimization.";

  static const cameraAllowed = "Camera & Storage permission allowed";
  static const cameraDisallowed =
      "Camera & Storage permission is required. This is use for you to update your profile picture.";

  static const microphoneAllowed = "Microphone permission allowed";
  static const microphoneDisallowed =
      "Microphone permission is required. App feature will not work. This is use for you to broadcast audio.";

  static const notificationAllowed = "Notification permission allowed";
  static const notificationDisallowed = "Notification permission is required in order to receive prayer notifications.";
}

class PermissionString2 {
  static const gpsDeviceTitle = "GPS Sensor tidak aktif !";
  static const gpsDeviceSubTitle = "Mohon aktifkan GPS Sensor agar fitur ini dapat berjalan.";

  static const gpsPermissionTitle = "Izinkan penggunaan GPS !";
  static const gpsPermissionSubTitle = "Penggunaan GPS diperlukan agar fitur ini dapat berjalan.";

  static const batteryOptzInclude =
      "To avoid problems with prayer notifications and widgets updates, please exclude the app from battery optimization in your device settings.";
  static const batteryOptzExclude = "App is excluded from battery optimization.";

  static const cameraAllowed = "Camera & Storage permission allowed";
  static const cameraDisallowed =
      "Camera & Storage permission is required. This is use for you to update your profile picture.";

  static const microphonePermissionTitle = "Izinkan penggunaan Microphone !";
  static const microphonePermissionSubTitle = "Penggunaan Microphone diperlukan agar fitur ini dapat berjalan.";

  static const notificationAllowed = "Notification permission allowed";
  static const notificationDisallowed = "Notification permission is required in order to receive prayer notifications.";
}
