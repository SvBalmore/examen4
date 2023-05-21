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
      // return ios;
      case TargetPlatform.macOS:
      //return macos;
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
    apiKey: 'AIzaSyDHgcy3r6eSot-pdt4ng7A9LVWxaCjXXSg',
    appId: '1:1066823554275:web:a5f7bfd01c2923f51821d6',
    messagingSenderId: '1066823554275',
    projectId: 'parcialfluter',
    authDomain: 'parcialfluter.firebaseapp.com',
    storageBucket: 'parcialfluter.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAWsWS-o5hJTpeJ8ob5OVcpC8fjK11HiUc',
    appId: '1:1066823554275:android:25c2b53e9d905afc1821d6',
    messagingSenderId: '1066823554275',
    projectId: 'parcialfluter',
    storageBucket: 'parcialfluter.appspot.com',
  );
}
