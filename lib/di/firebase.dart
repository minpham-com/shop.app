import 'dart:io' show Platform;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:store/env/env.dart';

Future<void> setupFirebase() async {
  Firebase.initializeApp(
      name: '__app__',
      options: Platform.isIOS
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
              projectId: Env.firebaseAndroidProjectId));
}

Future<FirebaseRemoteConfig> getConfig() async {
  final FirebaseRemoteConfig config = FirebaseRemoteConfig.instance;
  await config.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 1),
  ));
  await config.setDefaults(<String, dynamic>{
    "app_name": "Min Store",
  });
  return config;
}

Future<FirebaseDatabase> getDatabase() async {
  final FirebaseDatabase database = FirebaseDatabase.instance;
  return database;
}
