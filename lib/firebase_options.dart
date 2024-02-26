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
    apiKey: 'AIzaSyBbrXPdpkFfQgJW1ycbgnVTArVaOY0DdG8',
    appId: '1:492897648490:web:40e6f6c0691890f14f2f13',
    messagingSenderId: '492897648490',
    projectId: 'chat-app-tr2-ee024',
    authDomain: 'chat-app-tr2-ee024.firebaseapp.com',
    storageBucket: 'chat-app-tr2-ee024.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBc8LMXEs4JNwFWXnJzOUArx3eNheToboY',
    appId: '1:492897648490:android:324ba27b7058fd094f2f13',
    messagingSenderId: '492897648490',
    projectId: 'chat-app-tr2-ee024',
    storageBucket: 'chat-app-tr2-ee024.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDsnabGkpAAMlXbLQqm1C7j_ujjuECT8GE',
    appId: '1:492897648490:ios:707a1226e9926e714f2f13',
    messagingSenderId: '492897648490',
    projectId: 'chat-app-tr2-ee024',
    storageBucket: 'chat-app-tr2-ee024.appspot.com',
    iosBundleId: 'com.example.chatApp2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDsnabGkpAAMlXbLQqm1C7j_ujjuECT8GE',
    appId: '1:492897648490:ios:224e521b56db404c4f2f13',
    messagingSenderId: '492897648490',
    projectId: 'chat-app-tr2-ee024',
    storageBucket: 'chat-app-tr2-ee024.appspot.com',
    iosBundleId: 'com.example.chatApp2.RunnerTests',
  );
}