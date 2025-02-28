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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAEFOMfOnIhk95O2O_d2POc84U6YEwI8Ic',
    appId: '1:167026100078:web:23acd4307ed36884dce37f',
    messagingSenderId: '167026100078',
    projectId: 'ecommerceapp-7029a',
    authDomain: 'ecommerceapp-7029a.firebaseapp.com',
    storageBucket: 'ecommerceapp-7029a.appspot.com',
    measurementId: 'G-CPZNMMJJFJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD0UL1n1B0l8UMmxsxYEDNr0aTS5ys6KVk',
    appId: '1:167026100078:android:94154603a7bdae9adce37f',
    messagingSenderId: '167026100078',
    projectId: 'ecommerceapp-7029a',
    storageBucket: 'ecommerceapp-7029a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCsEyW5vBhP9kWmUqdXv03RnTRh1cb7_zM',
    appId: '1:167026100078:ios:821d1169e9eb04b2dce37f',
    messagingSenderId: '167026100078',
    projectId: 'ecommerceapp-7029a',
    storageBucket: 'ecommerceapp-7029a.appspot.com',
    androidClientId: '167026100078-f3merfjck4beepn6ol2bgq7cle5omf3n.apps.googleusercontent.com',
    iosClientId: '167026100078-np8fuojrdt9s9jtokvqjaloll2j9knfo.apps.googleusercontent.com',
    iosBundleId: 'com.example.snapsell',
  );

}