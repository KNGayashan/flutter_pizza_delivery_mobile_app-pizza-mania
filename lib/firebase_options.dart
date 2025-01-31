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
    apiKey: 'AIzaSyDRX8URR3cte2kku3sFzvwqfLns7H1sv70',
    appId: '1:931347592750:web:2857ec6f04d2355f1bd1bf',
    messagingSenderId: '931347592750',
    projectId: 'login-application-flutterproj',
    authDomain: 'login-application-flutterproj.firebaseapp.com',
    storageBucket: 'login-application-flutterproj.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCybn-qg74uba5ATKoKkcmhWzP2gYboB58',
    appId: '1:931347592750:android:a9341d7c65ebb0291bd1bf',
    messagingSenderId: '931347592750',
    projectId: 'login-application-flutterproj',
    storageBucket: 'login-application-flutterproj.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA80COSimhEvz-Q7pj4OHcHc9JEEtRlg7Q',
    appId: '1:931347592750:ios:2930b78ec577183b1bd1bf',
    messagingSenderId: '931347592750',
    projectId: 'login-application-flutterproj',
    storageBucket: 'login-application-flutterproj.appspot.com',
    iosBundleId: 'com.example.pizzaMania',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA80COSimhEvz-Q7pj4OHcHc9JEEtRlg7Q',
    appId: '1:931347592750:ios:2930b78ec577183b1bd1bf',
    messagingSenderId: '931347592750',
    projectId: 'login-application-flutterproj',
    storageBucket: 'login-application-flutterproj.appspot.com',
    iosBundleId: 'com.example.pizzaMania',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDRX8URR3cte2kku3sFzvwqfLns7H1sv70',
    appId: '1:931347592750:web:ead8906f14f808251bd1bf',
    messagingSenderId: '931347592750',
    projectId: 'login-application-flutterproj',
    authDomain: 'login-application-flutterproj.firebaseapp.com',
    storageBucket: 'login-application-flutterproj.appspot.com',
  );
}
