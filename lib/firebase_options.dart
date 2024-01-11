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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBFcEDEL_ZX5Yu3DtSmnEceDUNEF8AlpcY',
    appId: '1:905065043605:android:6d1073697a5a9524966d9c',
    messagingSenderId: '905065043605',
    projectId: 'e-commerce-9bf64',
    storageBucket: 'e-commerce-9bf64.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAIKCfOaHB34y1k2mLag769SxmDex84Ohc',
    appId: '1:905065043605:ios:42562385c5d3f21d966d9c',
    messagingSenderId: '905065043605',
    projectId: 'e-commerce-9bf64',
    storageBucket: 'e-commerce-9bf64.appspot.com',
    androidClientId: '905065043605-rdr172g7cd3vjpa7htnonq96or34fubo.apps.googleusercontent.com',
    iosClientId: '905065043605-0latgne8vguun0tkscvlqbqv54eo3sgi.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterEcommerceApp',
  );
}
