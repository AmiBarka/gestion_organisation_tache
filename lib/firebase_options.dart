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
    apiKey: 'AIzaSyDYZVS7TeLbC3JQK5kGxZ6gtAjZF5USCrg',
    appId: '1:506249773629:web:dae37877300c28fea4e054',
    messagingSenderId: '506249773629',
    projectId: 'organisation-tache',
    authDomain: 'organisation-tache.firebaseapp.com',
    storageBucket: 'organisation-tache.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBLuLuujQYzdjjpe5KOXDMBLbF7VmOBu3E',
    appId: '1:506249773629:android:3bf7810b5a4b5f1ba4e054',
    messagingSenderId: '506249773629',
    projectId: 'organisation-tache',
    storageBucket: 'organisation-tache.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAvfxQy-_zJn2B6XlP-qo-OelnkeWwH5Qk',
    appId: '1:506249773629:ios:59c1be7e22de70baa4e054',
    messagingSenderId: '506249773629',
    projectId: 'organisation-tache',
    storageBucket: 'organisation-tache.appspot.com',
    iosBundleId: 'com.example.organisationTache',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAvfxQy-_zJn2B6XlP-qo-OelnkeWwH5Qk',
    appId: '1:506249773629:ios:a203082f8b2adbf6a4e054',
    messagingSenderId: '506249773629',
    projectId: 'organisation-tache',
    storageBucket: 'organisation-tache.appspot.com',
    iosBundleId: 'com.example.organisationTache.RunnerTests',
  );
}