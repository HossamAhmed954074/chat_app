// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBwTo32d6EyL-hFtAImAKDsvB4j5cmBspE',
    appId: '1:225177790110:web:7089903068529b24333d8f',
    messagingSenderId: '225177790110',
    projectId: 'chat-app-38edc',
    authDomain: 'chat-app-38edc.firebaseapp.com',
    storageBucket: 'chat-app-38edc.firebasestorage.app',
    measurementId: 'G-3J59G8WCXZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDiXP2PAI1ce3CTRZNSjIOlaJWp1GgGFMU',
    appId: '1:225177790110:android:3aaa82eae94660d0333d8f',
    messagingSenderId: '225177790110',
    projectId: 'chat-app-38edc',
    storageBucket: 'chat-app-38edc.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC75hc56D16Tpel3uhz0CNTDr-VFnll-2A',
    appId: '1:225177790110:ios:8a18944da3174b0e333d8f',
    messagingSenderId: '225177790110',
    projectId: 'chat-app-38edc',
    storageBucket: 'chat-app-38edc.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC75hc56D16Tpel3uhz0CNTDr-VFnll-2A',
    appId: '1:225177790110:ios:8a18944da3174b0e333d8f',
    messagingSenderId: '225177790110',
    projectId: 'chat-app-38edc',
    storageBucket: 'chat-app-38edc.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBwTo32d6EyL-hFtAImAKDsvB4j5cmBspE',
    appId: '1:225177790110:web:302b66d8ada890d2333d8f',
    messagingSenderId: '225177790110',
    projectId: 'chat-app-38edc',
    authDomain: 'chat-app-38edc.firebaseapp.com',
    storageBucket: 'chat-app-38edc.firebasestorage.app',
    measurementId: 'G-GV0QYLQPBX',
  );
}
