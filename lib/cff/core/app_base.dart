import 'package:amoora_mkt/cff/env/env.dart';

class AppBase {
  static const imagePath = "assets/images";
  static const animationPath = "assets/animations";
  static const iconPath = "assets/icons";
  static const placeholderPath = "assets/placeholders";
  static String apiUrl = Env.envConfig == "DEVELOPMENT" ? Env.devApiUrl : Env.apiUrl;
  static String sseUrl = Env.envConfig == "DEVELOPMENT" ? Env.devSseUrl : Env.sseUrl;
  // static String pusherUrl = Env.envConfig == "DEVELOPMENT" ? Env.devPusherUrl : Env.pusherUrl;
  // static String pusherKey = Env.envConfig == "DEVELOPMENT" ? Env.devPusherKey : Env.pusherKey;
}
