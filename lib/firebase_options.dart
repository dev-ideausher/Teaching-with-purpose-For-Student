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
    apiKey: 'AIzaSyCuOXQP_qya93QG4DVleFguPIGO5Vl31js',
    appId: '1:807755555915:web:462e67a3d6e7f805ce99ce',
    messagingSenderId: '807755555915',
    projectId: 'learning-with-purpose-adc7e',
    authDomain: 'learning-with-purpose-adc7e.firebaseapp.com',
    storageBucket: 'learning-with-purpose-adc7e.appspot.com',
    measurementId: 'G-05KD0MZ0EC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-GSvfVE7ndVIuGHSkczpgxuIxRY8ukgg',
    appId: '1:807755555915:android:8588ec2c895e0c08ce99ce',
    messagingSenderId: '807755555915',
    projectId: 'learning-with-purpose-adc7e',
    storageBucket: 'learning-with-purpose-adc7e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6h_X2MGVe0TZAjBzudG-Cbim4OV1Pefw',
    appId: '1:807755555915:ios:79ea6a479aaf815ace99ce',
    messagingSenderId: '807755555915',
    projectId: 'learning-with-purpose-adc7e',
    storageBucket: 'learning-with-purpose-adc7e.appspot.com',
    androidClientId: '807755555915-q3oiencj36er4g6s366b6hjcmo2pk5hc.apps.googleusercontent.com',
    iosClientId: '807755555915-bfb455086easf7dttss76hqepv6nh2c9.apps.googleusercontent.com',
    iosBundleId: 'com.example.teachingWithPurposeStudent',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA6h_X2MGVe0TZAjBzudG-Cbim4OV1Pefw',
    appId: '1:807755555915:ios:0cb3b94ae37208a4ce99ce',
    messagingSenderId: '807755555915',
    projectId: 'learning-with-purpose-adc7e',
    storageBucket: 'learning-with-purpose-adc7e.appspot.com',
    androidClientId: '807755555915-q3oiencj36er4g6s366b6hjcmo2pk5hc.apps.googleusercontent.com',
    iosClientId: '807755555915-vemntinducl6h23h28j0u8otddnpi0f9.apps.googleusercontent.com',
    iosBundleId: 'com.example.teachingWithPurposeStudent.RunnerTests',
  );
}
