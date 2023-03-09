//import 'dart:io' show Platform;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
//import 'package:store/env/env.dart';
import 'package:store/env/env_key.dart';
import 'package:store/services/base_service.dart';

class FirebaseService extends BaseService {
  late final FirebaseRemoteConfig _config;
  late final FirebaseDatabase _database;

  static Future<void> initialize() async {
    Firebase.initializeApp(
      name: '__app__',
      /*options: Platform.isIOS
            ? FirebaseOptions(
                apiKey: Env.firebaseIosApiKey,
                appId: Env.firebaseIosAppId,
                messagingSenderId: Env.firebaseIosMessageSenderId,
                projectId: Env.firebaseIosProjectId,
                iosClientId: Env.firebaseIosClientId,
                iosBundleId: 'com.min.store',
              )
            : FirebaseOptions(
                apiKey: Env.firebaseAndroidApiKey,
                appId: Env.firebaseAndroidAppId,
                messagingSenderId: Env.firebaseAndroidMessageSenderId,
                projectId: Env.firebaseAndroidProjectId)
          */
    );
    await setupConfig();
  }

  static Future<FirebaseRemoteConfig> setupConfig() async {
    final FirebaseRemoteConfig config = FirebaseRemoteConfig.instance;
    await config.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));
    await config.setDefaults(<String, dynamic>{
      EnvKey.appName: "Min Store",
      EnvKey.apiUri: "http://localhost",
      EnvKey.isDark: false
    });

    return config;
  }

  FirebaseService() {
    _config = getConfig();
    _database = getDatabase();
  }

  FirebaseRemoteConfig getConfig() {
    final FirebaseRemoteConfig config = FirebaseRemoteConfig.instance;
    config.fetchAndActivate();
    return config;
  }

  FirebaseDatabase getDatabase() {
    final FirebaseDatabase database = FirebaseDatabase.instance;
    return database;
  }

  Future<String> getString(String key) async {
    return _config.getString(key);
  }

  Future<bool> getBool(String key) async {
    return _config.getBool(key);
  }

  Future<double> getDouble(String key) async {
    return _config.getDouble(key);
  }

  Future<int> getInt(String key) async {
    return _config.getInt(key);
  }

  Future<Map<String, RemoteConfigValue>> getAll() async {
    return _config.getAll();
  }

  Future<DatabaseReference> getRef() async {
    return _database.ref();
  }
}
