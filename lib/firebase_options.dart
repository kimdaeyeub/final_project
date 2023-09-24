// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAPCtfQTs92ky_qZd4I0qyVcibcyJybRd8',
    appId: '1:60548849191:web:7bc0fae5f9f13ad99ff802',
    messagingSenderId: '60548849191',
    projectId: 'new-project-99b88',
    authDomain: 'new-project-99b88.firebaseapp.com',
    storageBucket: 'new-project-99b88.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDjO1Fn_3oNBU0cgbK3bIZZpLmM815XbK8',
    appId: '1:60548849191:android:c498a17d5a502e8a9ff802',
    messagingSenderId: '60548849191',
    projectId: 'new-project-99b88',
    storageBucket: 'new-project-99b88.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDCi-jvClyoT_jwWf471imaYJIbrzXlTsU',
    appId: '1:60548849191:ios:61f15d04502f8a2f9ff802',
    messagingSenderId: '60548849191',
    projectId: 'new-project-99b88',
    storageBucket: 'new-project-99b88.appspot.com',
    iosBundleId: 'com.kdy.finalProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDCi-jvClyoT_jwWf471imaYJIbrzXlTsU',
    appId: '1:60548849191:ios:fac2c63c122de3d09ff802',
    messagingSenderId: '60548849191',
    projectId: 'new-project-99b88',
    storageBucket: 'new-project-99b88.appspot.com',
    iosBundleId: 'com.example.finalProject.RunnerTests',
  );
}