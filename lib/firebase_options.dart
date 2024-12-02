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
    apiKey: 'AIzaSyAu6HAuSfprOjU_UYiALvuPlsTVz6RLoDg',
    appId: '1:650096662198:web:7548dc2cae908b71afb817',
    messagingSenderId: '650096662198',
    projectId: 'fir-app-745e2',
    authDomain: 'fir-app-745e2.firebaseapp.com',
    storageBucket: 'fir-app-745e2.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAfKsj5J-LJg0VXpYuR-vuP3Dx_yNfz9gQ',
    appId: '1:650096662198:android:c03b3a1f06bd29c6afb817',
    messagingSenderId: '650096662198',
    projectId: 'fir-app-745e2',
    storageBucket: 'fir-app-745e2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDdX_8cqVqpKxienlgzier5zKhA9_omUh0',
    appId: '1:650096662198:ios:aa7cf648855882a1afb817',
    messagingSenderId: '650096662198',
    projectId: 'fir-app-745e2',
    storageBucket: 'fir-app-745e2.firebasestorage.app',
    iosBundleId: 'com.example.flutterCourse25143',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDdX_8cqVqpKxienlgzier5zKhA9_omUh0',
    appId: '1:650096662198:ios:d44230373abe33d0afb817',
    messagingSenderId: '650096662198',
    projectId: 'fir-app-745e2',
    storageBucket: 'fir-app-745e2.firebasestorage.app',
    iosBundleId: 'com.example.flutterDemo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAu6HAuSfprOjU_UYiALvuPlsTVz6RLoDg',
    appId: '1:650096662198:web:b0a6ec765f53b765afb817',
    messagingSenderId: '650096662198',
    projectId: 'fir-app-745e2',
    authDomain: 'fir-app-745e2.firebaseapp.com',
    storageBucket: 'fir-app-745e2.firebasestorage.app',
  );

}