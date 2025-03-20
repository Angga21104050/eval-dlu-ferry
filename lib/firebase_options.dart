// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
// / ```dart
// import 'firebase_options.dart';
// // / // ...
//  await Firebase.initializeApp(
//    options: DefaultFirebaseOptions.currentPlatform,
// );

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
    apiKey: 'AIzaSyDp-2Ji_qyoTc4p98zCWJfrN5nqod-5rzk',
    appId: '1:772211819850:web:03d5db8dc49ef2c488edb3',
    messagingSenderId: '772211819850',
    projectId: 'dlu-ferry-c7cb5',
    authDomain: 'dlu-ferry-c7cb5.firebaseapp.com',
    storageBucket: 'dlu-ferry-c7cb5.firebasestorage.app',
    measurementId: 'G-Z1S6F33HGM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCt2BVzkp6bU6TkycucVKJjOGakqVK4eQk',
    appId: '1:772211819850:android:b4c88d4d502f9f0988edb3',
    messagingSenderId: '772211819850',
    projectId: 'dlu-ferry-c7cb5',
    storageBucket: 'dlu-ferry-c7cb5.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCyM75Rn2UMk3UIQFGk6jN5vCwV-KwswOA',
    appId: '1:772211819850:ios:97cc5f52c263018488edb3',
    messagingSenderId: '772211819850',
    projectId: 'dlu-ferry-c7cb5',
    storageBucket: 'dlu-ferry-c7cb5.firebasestorage.app',
    iosBundleId: 'com.example.dluProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCyM75Rn2UMk3UIQFGk6jN5vCwV-KwswOA',
    appId: '1:772211819850:ios:97cc5f52c263018488edb3',
    messagingSenderId: '772211819850',
    projectId: 'dlu-ferry-c7cb5',
    storageBucket: 'dlu-ferry-c7cb5.firebasestorage.app',
    iosBundleId: 'com.example.dluProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDp-2Ji_qyoTc4p98zCWJfrN5nqod-5rzk',
    appId: '1:772211819850:web:dbceb1c9641e45fa88edb3',
    messagingSenderId: '772211819850',
    projectId: 'dlu-ferry-c7cb5',
    authDomain: 'dlu-ferry-c7cb5.firebaseapp.com',
    storageBucket: 'dlu-ferry-c7cb5.firebasestorage.app',
    measurementId: 'G-5KXXBL5Y4Z',
  );
}
