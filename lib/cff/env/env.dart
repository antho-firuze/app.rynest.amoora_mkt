import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  // FOR MAIN APPS
  @EnviedField(varName: 'ENV_CONFIG', obfuscate: true)
  static String envConfig = _Env.envConfig;

  @EnviedField(varName: 'API_URL', obfuscate: true)
  static String apiUrl = _Env.apiUrl;
  @EnviedField(varName: 'SSE_URL', obfuscate: true)
  static String sseUrl = _Env.sseUrl;
  @EnviedField(varName: 'DEV_API_URL', obfuscate: true)
  static String devApiUrl = _Env.devApiUrl;
  @EnviedField(varName: 'DEV_SSE_URL', obfuscate: true)
  static String devSseUrl = _Env.devSseUrl;
}
