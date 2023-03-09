import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  //The ofuscate flag lets you make your variables more
  // secure through obfuscation
  @EnviedField(varName: 'APP_NAME', obfuscate: true)
  // ignore: avoid_dynamic_calls
  static final String appName = _Env.appName;

  /*
  //The ofuscate flag lets you make your variables more
  // secure through obfuscation
  @EnviedField(varName: 'FIREBASE_ANDROID_PROJECT_ID', obfuscate: true)
  // ignore: avoid_dynamic_calls
  static final String firebaseAndroidProjectId = _Env.firebaseAndroidProjectId;

  @EnviedField(varName: 'FIREBASE_ANDROID_APP_ID', obfuscate: true)
  // ignore: avoid_dynamic_calls
  static final String firebaseAndroidAppId = _Env.firebaseAndroidAppId;

  @EnviedField(varName: 'FIREBASE_ANDROID_MESSAGE_SENDER_ID', obfuscate: true)
  // ignore: avoid_dynamic_calls
  static final String firebaseAndroidMessageSenderId =
      _Env.firebaseAndroidMessageSenderId;

  @EnviedField(varName: 'FIREBASE_ANDROID_API_KEY', obfuscate: true)
  // ignore: avoid_dynamic_calls
  static final String firebaseAndroidApiKey = _Env.firebaseAndroidApiKey;

  //The ofuscate flag lets you make your variables more
  // secure through obfuscation
  @EnviedField(varName: 'FIREBASE_IOS_PROJECT_ID', obfuscate: true)
  // ignore: avoid_dynamic_calls
  static final String firebaseIosProjectId = _Env.firebaseIosProjectId;

  @EnviedField(varName: 'FIREBASE_IOS_APP_ID', obfuscate: true)
  // ignore: avoid_dynamic_calls
  static final String firebaseIosAppId = _Env.firebaseIosAppId;

  @EnviedField(varName: 'FIREBASE_IOS_MESSAGE_SENDER_ID', obfuscate: true)
  // ignore: avoid_dynamic_calls
  static final String firebaseIosMessageSenderId =
      _Env.firebaseIosMessageSenderId;

  @EnviedField(varName: 'FIREBASE_IOS_API_KEY', obfuscate: true)
  // ignore: avoid_dynamic_calls
  static final String firebaseIosApiKey = _Env.firebaseIosApiKey;

  @EnviedField(varName: 'FIREBASE_IOS_CLIENT_ID', obfuscate: true)
  // ignore: avoid_dynamic_calls
  static final String firebaseIosClientId = _Env.firebaseIosClientId;
  */

  @EnviedField(varName: 'SENTRY_DSN', obfuscate: true)
  // ignore: avoid_dynamic_calls
  static final String sentryDsn = _Env.sentryDsn;

  @EnviedField(varName: 'API_URI', obfuscate: true)
  // ignore: avoid_dynamic_calls
  static final String apiUri = _Env.apiUri;
}
