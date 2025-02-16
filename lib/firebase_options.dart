import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyAu1eOSSBBoAa32cv00jJjFyXur3iYRnrU',
    appId: '1:176046065037:web:ca07018066c398be9629c4',
    messagingSenderId: '176046065037',
    projectId: 'eventlyapp-ae760',
    authDomain: 'eventlyapp-ae760.firebaseapp.com',
    storageBucket: 'eventlyapp-ae760.firebasestorage.app',
    measurementId: 'G-QPHEJY4TPF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAUOj5w5YZEyKyMxFZkSwFCmj4Zr0Zto18',
    appId: '1:176046065037:android:f0e0553c9f09a1439629c4',
    messagingSenderId: '176046065037',
    projectId: 'eventlyapp-ae760',
    storageBucket: 'eventlyapp-ae760.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCPZqYxRffif1_-tYVoVkf0YbnxvSPhiQI',
    appId: '1:176046065037:ios:e9c72fe29b2c1c6a9629c4',
    messagingSenderId: '176046065037',
    projectId: 'eventlyapp-ae760',
    storageBucket: 'eventlyapp-ae760.firebasestorage.app',
    iosClientId:
        '176046065037-u37k92hch89571em57gb39sgp0ag24e8.apps.googleusercontent.com',
    iosBundleId: 'com.example.eventlyApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCPZqYxRffif1_-tYVoVkf0YbnxvSPhiQI',
    appId: '1:176046065037:ios:e9c72fe29b2c1c6a9629c4',
    messagingSenderId: '176046065037',
    projectId: 'eventlyapp-ae760',
    storageBucket: 'eventlyapp-ae760.firebasestorage.app',
    iosClientId:
        '176046065037-u37k92hch89571em57gb39sgp0ag24e8.apps.googleusercontent.com',
    iosBundleId: 'com.example.eventlyApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAu1eOSSBBoAa32cv00jJjFyXur3iYRnrU',
    appId: '1:176046065037:web:3ac2c503c75c2dbd9629c4',
    messagingSenderId: '176046065037',
    projectId: 'eventlyapp-ae760',
    authDomain: 'eventlyapp-ae760.firebaseapp.com',
    storageBucket: 'eventlyapp-ae760.firebasestorage.app',
    measurementId: 'G-T8V1LS4S4B',
  );
}
